DIR_SCRIPT=$(dirname $(readlink -f $BASH_SOURCE))

##
## Install directory
##
if [ -z "$1" ] ; then
    echo "The 1st argument must be an installation directory."
    echo "Abort."
    return
fi
export DIR_INST=$(readlink -m $1)
export DIR_TOP=$(dirname $DIR_SCRIPT)
export DIR_BUILD=$DIR_TOP/build

##
## Setup script
##
mkdir -p $DIR_INST
\cp -u $DIR_SCRIPT/this-share-org.sh $DIR_INST/this-share.sh
source $DIR_INST/this-share.sh
