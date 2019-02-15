#!/bin/bash
##
## Install a recent cmake version
##
set -e
test -z $DIR_E1039_SHARE && exit 9
test -e $DIR_E1039_SHARE/inst/bin/cmake && exit

DIR_WORK=$DIR_E1039_SHARE/src/cmake
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4.tar.gz
tar xzf cmake-3.13.4.tar.gz
cd cmake-3.13.4
./bootstrap --prefix=$DIR_E1039_SHARE/inst
make
make install
