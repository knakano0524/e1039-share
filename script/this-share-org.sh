
if [ $E1039_SHARE ] ; then # Clean up the old components
    PATH=${PATH//"$E1039_SHARE/bin:"}
    CPATH=${CPATH//"$E1039_SHARE/include:"}
    LIBRARY_PATH=${LIBRARY_PATH//"$E1039_SHARE/lib:$E1039_SHARE/lib64:"}
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH//"$E1039_SHARE/lib:$E1039_SHARE/lib64:"}
fi

export E1039_SHARE=$(dirname $(readlink -f $BASH_SOURCE))
export LC_ALL=C

export LHAPDF_DATA_PATH=/cvmfs/sft.cern.ch/lcg/external/lhapdfsets/current
#export LHAPDF_DATA_PATH=$E1039_SHARE/share/LHAPDF

FN_THISROOT=$E1039_SHARE/root/bin/thisroot.sh
test -e $FN_THISROOT && source $FN_THISROOT
unset FN_THISROOT

FN_GEANT4=$E1039_SHARE/bin/geant4.sh
test -e $FN_GEANT4 && source $FN_GEANT4
unset FN_GEANT4

export     PYTHIA8=$E1039_SHARE/share/Pythia8
export PYTHIA8DATA=$PYTHIA8/xmldoc

export              PATH=$E1039_SHARE/bin:$PATH
export             CPATH=$E1039_SHARE/include:$CPATH
export      LIBRARY_PATH=$E1039_SHARE/lib:$E1039_SHARE/lib64:$LIBRARY_PATH
export   LD_LIBRARY_PATH=$E1039_SHARE/lib:$E1039_SHARE/lib64:$LD_LIBRARY_PATH
export ROOT_INCLUDE_PATH=$E1039_SHARE/include/GenFit

export ROOT_INCLUDE_PATH_E1039_SHARE=$ROOT_INCLUDE_PATH
