#!/bin/bash
DEFCFG=hamlinux_defconfig
COMMITID=`git describe --dirty | cut -d "-" -f 3-`
BRANCH=`git branch | grep "*" | cut -d " " -f 2`
DATUM=`date +%Y%m%d`

[ -z $TFTPPATH ] && TFTPPATH=/tftpboot/tseries/

for i in `seq 30 -1 1`; do
	CURPATH=`pwd | cut -d "/" -f $i`
	[ ! -z $CURPATH ] && break;
done

[ -z $OUTPATH ] && OUTPATH=../$CURPATH-$BRANCH
[ -z $PMEPATH ] && PMEPATH=/tmp/$CURPATH-$BRANCH"_"dts

if [ ! -d $OUTPATH ]; then
	echo "warning $OUTPATH doesn't exist, creating it!"
	mkdir $OUTPATH
	echo "also creating default-config ..."
	sleep 2
	make O=$OUTPATH $DEFCFG
fi

make O=$OUTPATH $1
