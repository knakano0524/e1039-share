#!/bin/bash
##
## Install Pythia6, which is required by e1039-core/simulation.
##
set -e
test -z $DIR_E1039_SHARE && exit 9
test -e $DIR_E1039_SHARE/inst/lib/libPythia6.so && exit

DIR_DAT=$(readlink -f ${0%'.sh'})

DIR_WORK=$DIR_E1039_SHARE/src/pythia6
mkdir -p $DIR_WORK
cd       $DIR_WORK

wget --quiet http://home.fnal.gov/~rhatcher/build_pythia6.sh.txt
mv build_pythia6.sh.txt build_pythia6.sh
chmod 775 build_pythia6.sh

patch <$DIR_DAT/patch.txt

./build_pythia6.sh 6.4.28
cp -a v6_428/lib/libPythia6.so $DIR_E1039_SHARE/inst/lib


## libPythia6.so could be created by the self-compilation procedure below but
## failed at being used in the ROOT compilation.
#
#wget --quiet http://www.hepforge.org/archive/pythiasix/pythia-6.4.28.f.gz
#gunzip pythia-6.4.28.f.gz
#
#gfortran -fPIC -shared -o libPythia6.so pythia-6.4.28.f
#
#mkdir -p $DIR_E1039_SHARE/inst/lib
#cp -a libPythia6.so $DIR_E1039_SHARE/inst/lib

