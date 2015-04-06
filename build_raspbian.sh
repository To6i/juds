#!/bin/bash
export CXXFLAGS="-O2 -pipe -march=armv6j -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard"
export CFLAGS="-O2 -pipe -march=armv6j -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard"
export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt/

echo Running autoconf.sh ...
./autoconf.sh

echo Running configure...
./configure

echo Patching Makefile...
patch < Makefile.patch || {
    echo Patching failed!
    exit 1
}

echo Running make...
make

echo Done!
