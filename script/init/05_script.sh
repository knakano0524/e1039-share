#!/bin/bash
##
## Install a recent cmake version
##
set -e
test -z $DIR_TOP  && exit 9
test -z $DIR_INST && exit 9

mkdir -p $DIR_INST
cp -a $DIR_TOP/script/this-share-org.sh $DIR_INST/this-share.sh
source $DIR_INST/this-share.sh
