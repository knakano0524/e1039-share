#!/bin/bash

DIR_SCRIPT=$(dirname $(readlink -f $0))
DIR_TOP=$(dirname $DIR_SCRIPT)
#echo $DIR_SCRIPT
#echo $DIR_TOP

if [ -z "$1" ] ; then
    echo "The 1st argument must be an installation directory."
    echo "Abort."
    exit
fi
DIR_INST=$(readlink -f $1)
echo $DIR_INST

mkdir -p $DIR_INST
cp -a $DIR_SCRIPT/this-share-org.sh $DIR_INST/this-share.sh
source $DIR_INST/this-share.sh

exit

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
