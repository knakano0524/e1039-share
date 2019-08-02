export E1039_SHARE=$(dirname $(readlink -f $BASH_SOURCE))
export LC_ALL=C

FN_THISROOT=$E1039_SHARE/root/bin/thisroot.sh
test -e $FN_THISROOT && source $FN_THISROOT
unset FN_THISROOT

FN_GEANT4=$E1039_SHARE/bin/geant4.sh
test -e $FN_GEANT4 && source $FN_GEANT4
unset FN_GEANT4

export     PYTHIA8=$E1039_SHARE/share/Pythia8
export PYTHIA8DATA=$PYTHIA8/xmldoc

export            PATH=$E1039_SHARE/bin:$PATH
export           CPATH=$E1039_SHARE/include:$CPATH
export    LIBRARY_PATH=$E1039_SHARE/lib:$E1039_SHARE/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=$E1039_SHARE/lib:$E1039_SHARE/lib64:$LD_LIBRARY_PATH

export ROOT_INCLUDE_PATH=$E1039_SHARE/include/GenFit:$E1039_SHARE/include/mysql:$ROOT_INCLUDE_PATH
