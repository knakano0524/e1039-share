export E1039_SHARE=$(dirname $(readlink -f $BASH_SOURCE))
export LC_ALL=C

FN_THISROOT=$E1039_SHARE/root/bin/thisroot.sh
test -e $FN_THISROOT && source $FN_THISROOT
unset FN_THISROOT

export            PATH=$E1039_SHARE/bin:$PATH
export           CPATH=$E1039_SHARE/include:$CPATH
export    LIBRARY_PATH=$E1039_SHARE/lib:$E1039_SHARE/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=$E1039_SHARE/lib:$E1039_SHARE/lib64:$LD_LIBRARY_PATH

export ROOT_INCLUDE_PATH=$E1039_SHARE/include/GenFit:$ROOT_INCLUDE_PATH
