#!/bin/bash
##
## Install Pythia8, which is required by ???.
##
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib/libpythia8.so && exit

DIR_WORK=$DIR_BUILD/pythia8
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet https://pythia.org/download/pythia82/pythia8240.tgz
tar xzf pythia8240.tgz
cd pythia8240
./configure --prefix=$DIR_INST --enable-shared
make
make install
