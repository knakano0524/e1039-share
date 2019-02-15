#!/bin/bash
##
## Install HepMC, which is required by ???.
##
set -e
test -z $DIR_E1039_SHARE && exit 9
test -e $DIR_E1039_SHARE/inst/lib/libHepMC.so && exit

DIR_WORK=$DIR_E1039_SHARE/src/hepmc
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://hepmc.web.cern.ch/hepmc/releases/hepmc2.06.09.tgz
tar xzf hepmc2.06.09.tgz
mkdir hepmc2.06.09-build
cd    hepmc2.06.09-build
cmake -DCMAKE_INSTALL_PREFIX=$DIR_E1039_SHARE/inst -Dmomentum=GEV -Dlength=CM ../hepmc2.06.09
make
make install
