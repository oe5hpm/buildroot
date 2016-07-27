#!/bin/bash
TARGETDIR=$1
BOARDDIR=$PWD/board/hpm/hamlinux-arm7

rm -r -f $TARGETDIR/root/

cp -r -f $BOARDDIR/rootfs-additions/* $TARGETDIR/

if [ $? -eq 0 ]; then
	echo "$0 done successfully."
else
	echo "$1 failed!"
fi
