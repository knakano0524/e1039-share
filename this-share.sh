export DIR_E1039_SHARE=$(dirname $(readlink -f $BASH_SOURCE))

export LC_ALL=C
if [ -e $DIR_E1039_SHARE/root/6.16.00/bin/thisroot.sh ] ; then
 source $DIR_E1039_SHARE/root/6.16.00/bin/thisroot.sh
fi
export            PATH=$DIR_E1039_SHARE/inst/bin:$PATH
export           CPATH=$DIR_E1039_SHARE/inst/include:$CPATH
export    LIBRARY_PATH=$DIR_E1039_SHARE/inst/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$DIR_E1039_SHARE/inst/lib:$LD_LIBRARY_PATH
