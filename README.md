
Author: Gilles Lasnier <gilles |d|o|t| lasnier [a|t] gmail /d/o/t/ com>


Description
===========

 This project is an example to show how to get the correct linux version of the
 Raspberry Pi (RPi) linux kernel to set up a cross-compilation environment.

 This project provides the required files for the several released version of
 the Raspbian Raspberry Pi Linux kernel.

 In cross-compilation, a compiler runs on a "host" to turn source code into
 executable code for a "target". When the host and the target are the same we
 talk about native compilation.


Requirements
============

 Issue the command "$ uname -r" on your RPi to get the version of the current
 linux kernel.

 From your RPi, using scp or others, retrieve the files:
 
 - /usr/share/doc/raspberrypi-bootloader/changelog.Debian.gz
 - /proc/config.gz

NOTE: with new rpi kernels and distribution, if the file /proc/config.gz
      is missing, try:
```  
  pi@raspberrypi:~ $ sudo modprobe configs
  pi@raspberrypi:~ $ zcat /proc/config.gz > raspios_kernel_$(uname -r).config
  pi@raspberrypi:~ $ head raspios_kernel_5.10.17-v7+.config 
  #
  # Automatically generated file; DO NOT EDIT.
  # Linux/arm 5.10.17 Kernel Configuration
  #
```
  
Usage
=====

 Put the two files in a folder named from the kernel version, at the root racine of
 the "getHash.sh" bash script and run the script with the linux version as argument.

 Example:
```
  $ mkdir 5.10.17-v7+
  $ cp .../config.gz 5.10.17-v7+/
  $ cp .../changelog.Debian.gz 5.10.17-v7+/
  $ chmod a+x getHash.sh
  $ ./getHash.sh 5.10.17-v7+
```

 Then follow the instruction to create the git branch corresponding to the
 Linux kernel version of your RPi.


LICENSE
=======

 The LICENSE doesn't apply for the files on the x.yy.zz+ folder which come
 from the Raspbian Raspberry Pi kernel and firmware distribution at:

 https://github.com/raspberrypi/linux
