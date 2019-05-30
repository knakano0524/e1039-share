#!/bin/bash
##
## Install ROOT
##
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/root/6.16.00 && exit

export LC_ALL=C
# Set the locale.  If it was "ja_JP.UTF-8", the error "Cannot determine
# location of C++ headers for runtime" occured in
# "root-6.16.00-src/interpreter/cling/lib/Interpreter/CMakeLists.txt"!!!

DIR_WORK=$DIR_BUILD/root
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet https://root.cern/download/root_v6.16.00.source.tar.gz
tar xzf root_v6.16.00.source.tar.gz
mkdir 6.16.00
cd    6.16.00
cmake -Dminuit2=on -Droofit=on -Dopengl=on ../root-6.16.00
cmake --build . -- -j6

##  Note below
# yum install libXmu-devel xerces-c-devel mesa-libGL-devel
