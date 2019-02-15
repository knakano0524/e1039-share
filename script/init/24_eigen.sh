#!/bin/bash
##
## Install Eigen, which is required by e1039-core/simulation/g4main.
##
set -e
test -z $DIR_E1039_SHARE && exit 9
test -e $DIR_E1039_SHARE/inst/include/Eigen && exit

DIR_WORK=$DIR_E1039_SHARE/src/eigen
mkdir -p $DIR_WORK
cd       $DIR_WORK

wget --quiet http://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2
tar xjf 3.3.7.tar.bz2

mkdir -p $DIR_E1039_SHARE/inst/include
cp -a eigen-eigen-323c052e1731/Eigen $DIR_E1039_SHARE/inst/include

# When I used cmake to install this software (by the following commands),
# the directory hierarchy becomes "$DIR_E1039_SHARE/inst/include/eigen3/Eigen",
# which doesn't meet your usage...
#
#  mkdir 3.3.7-build
#  cd    3.3.7-build
#  cmake -DCMAKE_INSTALL_PREFIX=$DIR_E1039_SHARE/inst ../eigen-eigen-323c052e1731/Eigen
#  make install
