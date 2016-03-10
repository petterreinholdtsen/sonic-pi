#--
# This file is part of Sonic Pi: http://sonic-pi.net
# Full project source: https://github.com/samaaron/sonic-pi
# License: https://github.com/samaaron/sonic-pi/blob/master/LICENSE.md
#
# Copyright 2013, 2014, 2015, 2016 by Sam Aaron (http://sam.aaron.name).
# All rights reserved.
#
# Permission is granted for use, copying, modification, and
# distribution of modified versions of this work as long as this
# notice is included.
#++

require_relative "../../setup_test"
require_relative "../../../lib/sonicpi/util"
require_relative "../../../lib/sonicpi/sample_loader"

module SonicPi
  module Lang
    module Sound
      module_function :sample_duration
      module_function :pitch_to_ratio
      module_function :sample_split_filts_and_opts


      # mock out load_sample to always return a sample with duration 8
      def self.load_sample_at_path(path)
        mock_samp = Struct.new(:duration)
        mock_samp.new(8)
      end

      # mock out current bpm to be 60
      def self.current_bpm
        60
      end

      def self.sample_path(*args)
        "/foo/bar"
      end
    end
  end

  class SampleDurationTester < Minitest::Test

    def test_duration_of_samples
      assert_equal(8,  Lang::Sound.sample_duration(:foo))
      assert_equal(16, Lang::Sound.sample_duration(:foo, rate: 0.5))
      assert_equal(4,  Lang::Sound.sample_duration(:foo, rate: 2))
      assert_equal(4,  Lang::Sound.sample_duration(:foo, rate: -2))
      assert_equal(8,  Lang::Sound.sample_duration(:foo, rate: 1, attack: 1))
      assert_equal(8,  Lang::Sound.sample_duration(:foo, rate: 1, release: 1))
      assert_equal(1,  Lang::Sound.sample_duration(:foo, rate: 1, sustain: 0, release: 1))
      assert_equal(4,  Lang::Sound.sample_duration(:foo, rate: 1, rpitch: 12))
      assert_equal(3,  Lang::Sound.sample_duration(:foo, rate: 1, beat_stretch: 3))
      assert_equal(1,  Lang::Sound.sample_duration(:foo, rate: 1, pitch_stretch: 1))
      assert_equal(4,  Lang::Sound.sample_duration(:foo, rate: 1, start: 0.5), 4)
      assert_equal(2,  Lang::Sound.sample_duration(:foo, rate: 1, start: 0.5, finish: 0.75))
      assert_equal(2,  Lang::Sound.sample_duration(:foo, rate: 1, finish: 0.5, start: 0.75))
      assert_equal(1,  Lang::Sound.sample_duration(:foo, rate: 2, finish: 0.5, start: 0.75))
    end

  end
end
