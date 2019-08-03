#!/bin/bash
##
## OpenGL, which is not available on OSG.
##
set -e

if [ ${HOSTNAME:0:13} != 'spinquestgpvm' ] ; then
    echo "Do nothing since host != gpvm."
    exit 0
fi

test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib64/libOpenGL.so && exit

## I gave up building OpenGL since it requires some packages missed on gpvm01.
## Instead I just copy the system-wide files here...
mkdir -p $DIR_INST/lib64
( # cd in sub-shell
    cd /usr/lib64
    if [ ! -e libOpenGL.so ] ; then
	echo "Cannot find /usr/lib64/libOpenGL.so etc.  Abort."
	exit 1
    fi
    cp -a libGLX.so* libGLdispatch.so* libOpenGL.so* $DIR_INST/lib64
)

# The version selected here is very old but is the one in SLF 7.6...
#
#DIR_WORK=$DIR_BUILD/opengl
#mkdir -p $DIR_WORK
#cd       $DIR_WORK
#wget --quiet https://mesa.freedesktop.org/archive/mesa-18.0.5.tar.gz
#tar xzf mesa-18.0.5.tar.gz
#cd mesa-18.0.5
#./configure --prefix=$DIR_INST
#make
#make install
#
# Do wee need GUL also?
# https://mesa.freedesktop.org/archive/glu/glu-9.0.0.tar.bz2
