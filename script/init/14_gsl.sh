#!/bin/bash
##
## GSL (why not available on gpvm?)
##
set -e

if [ ${HOSTNAME:0:13} != 'spinquestgpvm' ] ; then
    echo "Do nothing since host != gpvm."
    exit 0
fi

test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib/libgsl.so && exit

DIR_WORK=$DIR_BUILD/gsl
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://ftp.gnu.org/gnu/gsl/gsl-2.5.tar.gz
tar xzf gsl-2.5.tar.gz
cd gsl-2.5
./configure --prefix=$DIR_INST
make
make install
