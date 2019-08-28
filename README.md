# CyUSB Suite For Linux

This repo is based on CyUSB Suite For Linux, version 1.0.5, created by
Cypress Semiconductor Corporation, which is released under the terms
of the GNU LGPL 2.1.

## Pre-requisites
 1. libusb-1.0.x is required for compilation and functioning of the API
    library.
 2. Native gcc/g++ tool-chain and the GNU make utility are required for
    compiling the library and application.
 2. qt4 is required for building the cyusb_linux GUI application.
 3. The pidof command is used by the cyusb_linux application to handle
    hot-plug of USB devices.

## Installation Steps

 1. cd to the main directory where files where extracted and execute 'make'.
    This will compile the libcyusb library and create a static library.

    For example, if the archive is extracted to /home/user/cyusb_linux_1.0.5; then
    e.g.: user@desktop:/home/user/cyusb_linux_1.0.5 $ make
    
 2. Build the GUI:

        cd gui_src
        qmake-qt4
        make -j

 3. The install.sh script compiles the cyusb_linux GUI application, and installs
    the libcyusb library and the application in the system directories (/usr by default).
    It also sets up a set of UDEV rules and updates the environment variables under
    the /etc directory.

    As these changes require root (super user) permissions, the install.sh script
    needs to be executed from a root login.

    e.g.: root@desktop:/home/user/cyusb_linux_1.0.5 $ ./install.sh

 4. The GUI application can now be launched using the 'cyusb_linux' command.
