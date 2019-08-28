# CyUSB Suite For Linux

This repo is based on CyUSB Suite For Linux, version 1.0.5, created by
Cypress Semiconductor Corporation, which is released under the terms
of the GNU LGPL 2.1.

## Pre-requisites
 1. libusb-1.0.x is required for compilation and functioning of the API
    library.
 2. Native gcc/g++ tool-chain and the GNU make utility are required for
    compiling the library and application.
 2. qt5 is required for building the cyusb_linux GUI application.
 3. The pidof command is used by the cyusb_linux application to handle
    hot-plug of USB devices.
    
## udev rules

To install udev rules:

    sudo ./install_udev_rules.sh

## Build and run

    mkdir build
    cd build
    cmake -G Ninja ..
    ninja
    
    ./cyusb
