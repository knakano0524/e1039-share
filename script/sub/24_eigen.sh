#!/bin/bash
##
## Install Eigen, which is required by e1039-core/simulation/g4main.
## Actually a YUM package "eigen3-devel" (3.3.7) could be usable.
##
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/include/Eigen && exit

DIR_WORK=$DIR_BUILD/eigen
mkdir -p $DIR_WORK
cd       $DIR_WORK

wget --quiet https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2
tar xjf eigen-3.3.7.tar.bz2

mkdir -p $DIR_INST/include
cp -a eigen-3.3.7/Eigen $DIR_INST/include

# When I used cmake to install this software (by the following commands),
# the directory hierarchy becomes "$DIR_E1039_SHARE/inst/include/eigen3/Eigen",
# which doesn't meet your usage...
#
#  mkdir 3.3.7-build
#  cd    3.3.7-build
#  cmake -DCMAKE_INSTALL_PREFIX=$DIR_E1039_SHARE/inst ../eigen-eigen-323c052e1731/Eigen
#  make install
