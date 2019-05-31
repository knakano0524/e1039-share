#!/bin/bash
##
## Install ROOT5
##
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test "X$ROOT_VER" != 'X5' && exit
test -e $DIR_INST/root/bin/thisroot.sh && exit

DIR_WORK=$DIR_BUILD/root
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet https://root.cern.ch/download/root_v5.34.38.source.tar.gz
tar xzf root_v5.34.38.source.tar.gz
mkdir build
cd    build
cmake -DCMAKE_INSTALL_PREFIX=$DIR_INST/root -Dminuit2=on -Droofit=on -Dopengl=on ../root
cmake --build . --target install -- -j6
