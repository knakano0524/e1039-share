#!/bin/bash
##
## Install Geant4, which is required by ???.
##
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib64/libG4global.so && exit

DIR_WORK=$DIR_BUILD/geant4
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://geant4.cern.ch/support/source/geant4.10.01.p03.tar.gz
tar xzf geant4.10.01.p03.tar.gz
mkdir   geant4.10.01.p03-build
cd      geant4.10.01.p03-build
cmake  -DCMAKE_INSTALL_PREFIX=$DIR_INST  -DCLHEP_ROOT_DIR=$DIR_INST  -DGEANT4_INSTALL_DATA=ON  -DGEANT4_USE_GDML=ON  -DGEANT4_USE_OPENGL_X11=ON  ../geant4.10.01.p03
make -j6
make install

##  Note below
# yum install libXmu-devel xerces-c-devel mesa-libGL-devel
