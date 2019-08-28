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

if [ $A != 'root' ]; then
   echo "You have to be root to run this script"
   exit 1;
fi

cp configs/cyusb.conf /etc/

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
