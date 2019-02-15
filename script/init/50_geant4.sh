#!/bin/bash
##
## Install Geant4, which is required by ???.
##
set -e
test -z $DIR_E1039_SHARE && exit 9
test -e $DIR_E1039_SHARE/inst/lib64/libG4global.so && exit

DIR_WORK=$DIR_E1039_SHARE/src/geant4
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://geant4.cern.ch/support/source/geant4.10.01.p03.tar.gz
tar xzf geant4.10.01.p03.tar.gz
mkdir   geant4.10.01.p03-build
cd      geant4.10.01.p03-build
cmake  -DCMAKE_INSTALL_PREFIX=$DIR_E1039_SHARE/inst  -DCLHEP_ROOT_DIR=$DIR_E1039_SHARE/inst  -DGEANT4_INSTALL_DATA=ON  -DGEANT4_USE_GDML=ON  -DGEANT4_USE_OPENGL_X11=ON  ../geant4.10.01.p03
make -j6
make install

##  Note below
# yum install libXmu-devel xerces-c-devel mesa-libGL-devel
