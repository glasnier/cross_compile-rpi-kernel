
Author: Gilles Lasnier <gilles.lasnier@gmail.com>


Description
===========

 This project is an example to show how to get the correct linux version of the
 Raspberry Pi (RPi) linux kernel to set up a cross-compilation environment.
 
 This project provides the required files for the linux kernel v3.12.22+
 
 In cross-compilation, a compiler runs on a "host" to turn source code into 
 executable code for a "target". When the host and the target are the same we
 talk about native compilation. 


Requirements
============

 Issue the command "$ uname -r" on your RPi to get the version of the current
 linux kernel.

 From your RPi, using scp or others, retrieve the files:
  /usr/share/doc/raspberrypi-bootloader/changelog.Debian.gz
 
 , and

  /proc/config.gz

NOTE: with new rpi kernels and distribution, if the file /proc/config.gz 
      is missing, try:
         $ sudo modprobe configs

Usage
=====

 Put the two files and the "getHash.sh" bash script in the same folder and
 run the script with the linux version as argument.

 Example:
   $ chmod a+x getHash.sh
   $ ./getHash.sh 3.12.22+

 Then follow the instruction to create the git branch corresponding to the
 linux kernel version of your RPi.
 

LICENSE
=======

 The LICENSE doesn't apply for the files on the x.yy.zz+ folder which come 
 from the Raspberry Pi kernel distribution at:
 
 https://github.com/raspberrypi/linux



