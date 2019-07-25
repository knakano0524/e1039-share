#!/bin/bash
##
## Install ROOT
##
set -e
test -z $DIR_BUILD && exit 9
test -z $DIR_INST  && exit 9
test "X$ROOT_VER" != 'X6' && exit
test -e $DIR_INST/root/bin/thisroot.sh && exit

export LC_ALL=C
# Set the locale.  If it was "ja_JP.UTF-8", the error "Cannot determine
# location of C++ headers for runtime" occured in
# "root-6.16.00-src/interpreter/cling/lib/Interpreter/CMakeLists.txt"!!!

DIR_WORK=$DIR_BUILD/root
mkdir -p $DIR_WORK
cd       $DIR_WORK
wget --quiet https://root.cern/download/root_v6.16.00.source.tar.gz
tar xzf root_v6.16.00.source.tar.gz
mkdir build
cd    build

if [ ${HOSTNAME:0:13} = 'spinquestgpvm' ] ; then
    OPT_EXTRA='-DGIF_INCLUDE_DIR:PATH=GIF_INCLUDE_DIR-NOTFOUND  -DGIF_LIBRARY:FILEPATH=GIF_LIBRARY-NOTFOUND'
    # Without this option, cmake tries to link the 32-bit file 
    # (/usr/lib/libgif.so) and thus fails.  Why is '/usr/lib64/libgif.so'
    # missing on gpvm?!  The option below works as well.
    #OPT_EXTRA='-DGIF_LIBRARY=/usr/lib64/libgif.so.4'
fi
cmake -DCMAKE_INSTALL_PREFIX=$DIR_INST/root -Dminuit2=on -Droofit=on -Dopengl=on $OPT_EXTRA ../root-6.16.00
cmake --build . --target install -- -j6
