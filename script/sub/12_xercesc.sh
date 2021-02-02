#!/bin/bash
##
## Xerces-C++, needed by Geant4.
##
set -e

if [ -z "$SINGULARITY_NAME" -a ${HOSTNAME:0:13} != 'spinquestgpvm' ] ; then
    echo "Do nothing for this environment."
    exit 0
fi

test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib64/libxerces-c.so && exit

DIR_WORK=$DIR_BUILD/xerces
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.2.tar.bz2
tar xjf xerces-c-3.2.2.tar.bz2
cd xerces-c-3.2.2
cmake -DCMAKE_INSTALL_PREFIX=$DIR_INST
cmake --build . --target install
