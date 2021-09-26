#!/bin/bash
##
## Install CLHEP, which is required by Geant4 etc.
##   This script just follows "README.md".
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib/libCLHEP.so && exit

DIR_WORK=$DIR_BUILD/clhep
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://lcgpackages.web.cern.ch/lcgpackages/tarFiles/sources/clhep-2.4.4.0.tgz
tar xzf clhep-2.4.4.0.tgz
mkdir build
cd    build
cmake -DCMAKE_INSTALL_PREFIX=$DIR_INST ../CLHEP-CLHEP_2_4_4_0
cmake --build . --config RelWithDebInfo
ctest
cmake --build . --target install
