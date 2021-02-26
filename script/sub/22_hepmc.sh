#!/bin/bash
##
## Install HepMC, which is required by ???.
## Actually a YUM package "HepMC-devel" (2.06.11) could be usable.
##
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib/libHepMC.so && exit

DIR_WORK=$DIR_BUILD/hepmc
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet http://hepmc.web.cern.ch/hepmc/releases/hepmc2.06.09.tgz
tar xzf hepmc2.06.09.tgz
mkdir hepmc2.06.09-build
cd    hepmc2.06.09-build
cmake -DCMAKE_INSTALL_PREFIX=$DIR_INST -Dmomentum=GEV -Dlength=CM ../hepmc2.06.09
make
make install
