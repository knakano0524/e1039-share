#!/bin/bash
##
## Install Geant4, which is required by e1039-core.
##
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib64/libG4global.so && exit

DIR_WORK=$DIR_BUILD/geant4
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet https://geant4-data.web.cern.ch/releases/geant4.10.07.p02.tar.gz
tar xzf geant4.10.07.p02.tar.gz
mkdir   geant4.10.07.p02-build
cd      geant4.10.07.p02-build
cmake  -DCMAKE_INSTALL_PREFIX=$DIR_INST  -DCLHEP_ROOT_DIR=$DIR_INST  -DGEANT4_BUILD_CXXSTD=11  -DGEANT4_INSTALL_DATA=ON  -DGEANT4_USE_GDML=ON  -DGEANT4_USE_OPENGL_X11=ON  ../geant4.10.07.p02
make -j6
make install

if [ ${HOSTNAME:0:13} = 'spinquestgpvm' ] ; then
    ## Reduce the number of files to mitigate the load on CVMFS.
    rm -r $DIR_INST/share/Geant4-*/examples
fi

## Note
# The cmake option "-DGEANT4_BUILD_CXXSTD=c++11" was needed because of
# "char16_t" used in Xerces-c-3.2.2.  Probably it is not needed in case of
# Xerces-c-3.1.3.
