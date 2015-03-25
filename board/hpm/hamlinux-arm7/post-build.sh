#!/bin/bash
TARGETDIR=$1
BOARDDIR=$PWD/board/hpm/hamlinux-arm7
COMMITID=`git describe --dirty | cut -d "-" -f 3-`
BRANCH=`git branch | grep "*" | cut -d " " -f 2`
DATUM=`date +%Y%m%d`

rm -r -f $TARGETDIR/root/

cp -r -f $BOARDDIR/rootfs-additions/* $TARGETDIR/

echo "hamlinux (build: $BRANCH / $COMMITID) from $DATUM" > $TARGETDIR/versioninfo.txt

cp $TARGETDIR/../.config $BOARDDIR/.config-old
cp $TARGETDIR/../.config $BOARDDIR

if [ $? -eq 0 ]; then
	echo "$0 done successfully."
else
	echo "$1 failed!"
fi
