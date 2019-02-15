#!/bin/bash
##
## Install Pythia8, which is required by ???.
##
set -e
test -z $DIR_E1039_SHARE && exit 9
test -e $DIR_E1039_SHARE/inst/lib/libpythia8.so && exit

DIR_WORK=$DIR_E1039_SHARE/src/pythia8
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://home.thep.lu.se/~torbjorn/pythia8/pythia8240.tgz
tar xzf pythia8240.tgz
cd pythia8240
./configure --prefix=$DIR_E1039_SHARE/inst --enable-shared
make
make install
