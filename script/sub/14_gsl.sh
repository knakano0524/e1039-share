#!/bin/bash
##
## GSL (why not available on gpvm?)
##
set -e

if [ -z "$SINGULARITY_NAME" -a ${HOSTNAME:0:13} != 'spinquestgpvm' ] ; then
    echo "Do nothing for this environment."
    exit 0
fi

test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib/libgsl.so && exit

DIR_WORK=$DIR_BUILD/gsl
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://ftp.gnu.org/gnu/gsl/gsl-1.15.tar.gz
tar xzf gsl-1.15.tar.gz
cd gsl-1.15
./configure --prefix=$DIR_INST
make
make install
