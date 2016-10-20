#!/bin/bash
DEFCFG=hamlinux_upd_defconfig

[ -z $OUTPATH ] && OUTPATH=../buildroot-hamlinux_upd

if [ ! -d $OUTPATH ]; then
	echo "warning $OUTPATH doesn't exist, creating it!"
	mkdir $OUTPATH
	echo "also creating default-config ..."
	sleep 2
	make O=$OUTPATH $DEFCFG
fi

make O=$OUTPATH $1
