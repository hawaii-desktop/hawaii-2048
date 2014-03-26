2048 for Hawaii
===============

Porting of [2048](https://github.com/Saming/2048) to QML.

This is a highly addictive game where you use arrow keys to move
tiles in a 4x4 grid. When two tiles of the same number touch,
they merge into one.

If you get a tile with 2048 you win!

## Dependencies

In order to build and install this application you need Qt 5.1 or better with
at least the following modules:

* qtbase
* qtdeclarative
* qtquickcontrols

You can either build Qt from git yourself or download binaries.

More information about building Qt 5 from can be found here:

  http://qt-project.org/wiki/Building-Qt-5-from-Git

Qt 5 binaries can be downloaded from http://qt-project.org/downloads

## Build

Building this application is a piece of cake.

Assuming you are in the source directory, just create a build directory
and run cmake:

```sh
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/hawaii ..
```

To do a debug build the last command can be:

```sh
cmake -DCMAKE_INSTALL_PREFIX=/opt/hawaii -DCMAKE_BUILD_TYPE=Debug ..
```

To do a release build instead it can be:

```sh
cmake -DCMAKE_INSTALL_PREFIX=/opt/hawaii -DCMAKE_BUILD_TYPE=Release ..
```

If not passed, the `CMAKE_INSTALL_PREFIX` parameter defaults to /usr/local.
You have to specify a path that fits your needs, /opt/hawaii is just an example.

Package maintainers would pass `-DCMAKE_INSTALL_PREFIX=/usr`.

The `CMAKE_BUILD_TYPE` parameter allows the following values:

* **Debug:** debug build
* **Release:** release build
* **RelWithDebInfo:** release build with debugging information

## Installation

It's really easy, it's just a matter of typing:

```sh
make install
```

from the build directory.
