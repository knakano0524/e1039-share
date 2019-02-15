#!/bin/bash
##
## Install CLHEP, which is required by Geant4 etc.
##   This script just follows "README.md".
set -e
test -z $DIR_E1039_SHARE && exit 9
test -e $DIR_E1039_SHARE/inst/lib/libCLHEP.so && exit

DIR_WORK=$DIR_E1039_SHARE/src/clhep
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/clhep-2.2.0.4.tgz
tar xzf clhep-2.2.0.4.tgz
cd 2.2.0.4
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$DIR_E1039_SHARE/inst ../CLHEP
cmake --build . --config RelWithDebInfo
ctest
cmake --build . --target install
