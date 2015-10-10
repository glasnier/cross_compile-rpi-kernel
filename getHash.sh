#!/bin/bash

# Author: Gilles Lasnier <gilles.lasnier@gmail.com>
# Date: 
#   - created on 2014-07-23

#### Functions

function usage() {
  echo "This script set the linux Raspberry Pi (RPi) kernel git branch "
  echo "corresponding to the linux kernel running on the RPi."
  echo ""
  echo "Usage:"
  echo "        ./$(basename $0) <linux-rpi-version>"
  echo ""
  
  exit 1; 
}

#### Command line argument treatment

if [ $# -ne 1 ] ; then
  usage
fi

#### Application

PLATFORM=`uname -s` 

echo ""
echo "#########################################################################"
echo "                     GET Raspberry Pi kernel information                 "
echo "#########################################################################"
echo ""

LINUXVERSION=$1

if [ ${PLATFORM} = "Darwin" ]
then
    FWHASH=`gunzip -c ${1}/changelog.Debian.gz | grep -m 1 'as of' | awk '{print $NF}'`
elif [ ${PLATFORM} = "Linux" ]
then
    FWHASH=`zcat ${1}/changelog.Debian.gz | grep -m 1 'as of' | awk '{print $NF}'`
else
    echo "Sorry, the platform ${PLATFORM} is not supported !!!"    
    exit -1
fi

echo "Firmware Hashcode: fwhash = $FWHASH"

LINUXHASH=`wget -qO- https://raw.github.com/raspberrypi/firmware/$FWHASH/extra/git_hash`

echo ""
echo "Linux Hashcode: linuxhash = $LINUXHASH"
echo ""

echo "You can now issue:"
echo "  $ cd ../rpi-linux"
echo "  $ git checkout $LINUXHASH -b v$LINUXVERSION"
echo "  $ make mrproper"
echo "  $ mkdir build-linux-rpi-$LINUXVERSION"
echo "  $ zcat ../cross_compile-rpi-kernel/config.gz >\
 build-linux-rpi-$LINUXVERSION/.config"
echo "  $ make ARCH=arm CROSS_COMPILE=... O=build-linux-rpi-$LINUXVERSION\
 oldconfig"
echo "  $ make ARCH=arm CROSS_COMPILE=... O=build-linux-rpi-$LINUXVERSION\
 menuconfig"
echo "  $ make ARCH=arm CROSS_COMPILE=... O=build-linux-rpi-$LINUXVERSION"
echo ""
echo "#########################################################################"
echo ""

exit 0
