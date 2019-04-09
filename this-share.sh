export DIR_E1039_SHARE=$(dirname $(readlink -f $BASH_SOURCE))
export LC_ALL=C

OPTIND=1
while getopts ":5" OPT ; do
    case $OPT in
        5 ) USE_ROOT5=yes
            ;;
        * ) echo "An invalid option is given.  Do nothing."
            return
            ;;
    esac
done
shift $((OPTIND - 1))

FN_THISROOT=$DIR_E1039_SHARE/root/6.16.00/bin/thisroot.sh
test $USE_ROOT5 && FN_THISROOT=$DIR_E1039_SHARE/root5/5.34.38/bin/thisroot.sh
echo $FN_THISROOT
test -e $FN_THISROOT && source $FN_THISROOT

export            PATH=$DIR_E1039_SHARE/inst/bin:$PATH
export           CPATH=$DIR_E1039_SHARE/inst/include:$CPATH
export    LIBRARY_PATH=$DIR_E1039_SHARE/inst/lib:$DIR_E1039_SHARE/inst/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=$DIR_E1039_SHARE/inst/lib:$DIR_E1039_SHARE/inst/lib64:$LD_LIBRARY_PATH

unset USE_ROOT5
unset FN_THISROOT
