#!/bin/bash

if [ "X$1" != "Xgo" ] ; then
    echo "This script might cause a significant system-wide change."
    echo "If you really execute it, append 'go' argument, i.e. '$0 go'."
    echo "Abort."
    exit
fi

DIR_SCRIPT=$(dirname $(readlink -f $0))
source $DIR_SCRIPT/../this-share.sh

for FN_SH in $DIR_SCRIPT/init/[0-9][0-9]_*.sh ; do
    FN_LOG=$DIR_SCRIPT/log/log_$(basename $FN_SH .sh).txt
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
