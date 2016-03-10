
## Raspberry Pi

The Raspberry Pi will happily compile all the required aspects of Sonic
Pi. However, be warned that it will take quite some time to complete.

First grab the dependencies, compile the server extensions, then the GUI then start the app.

### Dependencies

The dependencies for building and running this are:

* `supercollider`
* `ruby1.9.3`
* `libqscintilla2-8`
* `libqscintilla2-dev`
* `qt4-dev-tools`
* `cmake`
* `ruby-dev`
* `libffi-dev`

Use `sudo apt-get install` to ensure each of these are on your system.

### Server extensions

Compile the server extensions by `cd`ing into the directory `app/server/bin` and running the script `compile-extensions.rb`. This will take some time.

### Qt GUI

`cd` into the directory `app/gui/qt/` and run the script `rp-build-app`. This will also take some time.

### Running

Run the script `rp-app-bin` in the directory `app/gui/qt`.
