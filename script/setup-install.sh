DIR_SCRIPT=$(dirname $(readlink -f $BASH_SOURCE))

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
            return
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
    return
fi
export DIR_INST=$(readlink -f $1)
export DIR_TOP=$(dirname $DIR_SCRIPT)
export DIR_BUILD=$DIR_TOP/build$ROOT_VER

##
## Setup script
##
mkdir -p $DIR_INST
cp $DIR_SCRIPT/this-share-org.sh $DIR_INST/this-share.sh
source $DIR_INST/this-share.sh
