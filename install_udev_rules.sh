#!/bin/bash

set -eux

CURDIR=`pwd`
PREFIX="/usr"
BINDIR="${PREFIX}/bin"
LIBDIR="${PREFIX}/lib64"

A=`whoami`

if [ $A != 'root' ]; then
   echo "You have to be root to run this script"
   exit 1;
fi

cp configs/88-cyusb.rules /etc/udev/rules.d/
