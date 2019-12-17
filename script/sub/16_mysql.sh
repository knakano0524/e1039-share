#!/bin/bash
##
## MySQL, which is not available on OSG.
##
set -e

if [ ${HOSTNAME:0:13} != 'spinquestgpvm' ] ; then
    echo "Do nothing since host != gpvm."
    exit 0
fi

test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test -e $DIR_INST/lib/libmysqlclient.so && exit

DIR_WORK=$DIR_BUILD/mysql
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet -O mariadb-5.5.60.tar.gz "https://downloads.mariadb.org/interstitial/mariadb-5.5.60/source/mariadb-5.5.60.tar.gz/from/http%3A//ftp.hosteurope.de/mirror/archive.mariadb.org/"
tar xzf mariadb-5.5.60.tar.gz
cd mariadb-5.5.60
cmake -DCMAKE_INSTALL_PREFIX=$DIR_INST -DWITHOUT_SERVER=on
make
make install

# The version selected here is very old but is the one in SLF 7.6...
