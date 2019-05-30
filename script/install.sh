#!/bin/bash
DIR_SCRIPT=$(dirname $(readlink -f $0))
DIR_TOP=$(dirname $DIR_SCRIPT)

##
## Switches
##
export ROOT_VER=6
OPTIND=1
while getopts ":5" OPT ; do
    case $OPT in
        5 ) ROOT_VER=5
            ;;
        * ) echo "An invalid option is given.  Do nothing."
            exit
            ;;
    esac
done
shift $((OPTIND - 1))

##
## Install directory
##
if [ -z "$1" ] ; then
    echo "The 1st argument must be an installation directory."
    echo "Abort."
    exit
fi
export DIR_INST=$(readlink -f $1)
export DIR_BUILD=$DIR_TOP/build$ROOT_VER

mkdir -p $DIR_INST
cp -a $DIR_SCRIPT/this-share-org.sh $DIR_INST/this-share.sh
source $DIR_INST/this-share.sh

##
## Executions of subscripts
##
for FN_SH in $DIR_SCRIPT/init/[0-9][0-9]_*.sh ; do
    FN_LOG=$DIR_TOP/log/log_$(basename $FN_SH .sh).txt
    echo "----------------------------------------------------------------"
    echo "Script: $FN_SH"
    echo "----------------"
    $FN_SH 2>&1 | tee $FN_LOG
    RET=${PIPESTATUS[0]} ## = exit status of the '$FN_SH' command above
    if [ $RET -ne 0 ] ; then
	echo "Abort as '$FN_SH' returned '$RET'."
	echo "Check details in '$FN_LOG'."
	exit
    fi
done
echo "----------------------------------------------------------------"
echo "All have finished.  Congratulations!!"

{
    echo "The e1039-share package:"
    echo "Installed with $DIR_TOP"
    echo "          by $USER"
    echo "          on $HOSTNAME"
    echo "          at $(date)."
} >$DIR_INST/install.txt
