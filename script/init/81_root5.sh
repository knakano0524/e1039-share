#!/bin/bash
##
## Install ROOT5
##
set -e
test -z $DIR_E1039_SHARE && exit 9
test -e $DIR_E1039_SHARE/root5/5.34.38 && exit

DIR_WORK=$DIR_E1039_SHARE/root5
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet https://root.cern.ch/download/root_v5.34.38.source.tar.gz
tar xzf root_v5.34.38.source.tar.gz
mv root 5.34.38-src
mkdir   5.34.38
cd      5.34.38
cmake -Dminuit2=on -Droofit=on -Dopengl=on ../5.34.38-src
cmake --build . -- -j6
