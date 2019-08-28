#!/bin/bash

# This is the main installer for CyUSB Suite for Linux
# Run this script as root (superuser).
# (C) Cypress Semiconductor Company / ATR-LABS (www.atr-labs.com) - 2012
# Author - V. Radhakrishnan

set -eux

CURDIR=`pwd`
PREFIX="/usr"
BINDIR="${PREFIX}/bin"
LIBDIR="${PREFIX}/lib64"

echo "Your current directory is $CURDIR. This is where the cyusb_suite software will be installed..."
A=`whoami`

create_udev_rules() {
	echo "# Cypress USB driver for FX2 and FX3 (C) Cypress Semiconductor Corporation / ATR-LABS" > configs/88-cyusb.rules
	echo "# Rules written by V. Radhakrishnan ( rk@atr-labs.com )" >> configs/88-cyusb.rules
	echo "# Cypress USB vendor ID = 0x04b4" >> configs/88-cyusb.rules

	echo 'KERNEL=="*", SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ACTION=="add", ATTR{idVendor}=="04b4", MODE="666", TAG="cyusb_dev", RUN+="'"/usr/bin/cy_renumerate.sh A"'"' >> configs/88-cyusb.rules
	echo 'KERNEL=="*", SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ACTION=="remove", TAG=="cyusb_dev", RUN+="'"/usr/bin/cy_renumerate.sh R"'"' >> configs/88-cyusb.rules
}

if [ $A != 'root' ]; then
   echo "You have to be root to run this script"
   exit 1;
fi

create_udev_rules
cp configs/cyusb.conf /etc/
cp configs/88-cyusb.rules /etc/udev/rules.d/
make

# Copy the libcyusb library into the system library folders.
cp lib/libcyusb.so.1 "${LIBDIR}"
ln -s "${LIBDIR}/libcyusb.so.1" "${LIBDIR}/libcyusb.so"

cp $CURDIR/configs/cy_renumerate.sh "${BINDIR}"
chmod 777 "${BINDIR}/cy_renumerate.sh"

# # Set the CYUSB_ROOT variable to point to the current directory.
# echo "" >> /etc/profile
# echo "# Cypress USB Suite: Root directory" >> /etc/profile
# echo "export CYUSB_ROOT=$CURDIR" >> /etc/profile
# echo "" >> /etc/profile

# Install the cyusb_linux application.
cp $CURDIR/bin/cyusb_linux "${BINDIR}"
