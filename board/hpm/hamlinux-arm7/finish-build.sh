#!/bin/bash
DESTDIR=/tftpboot/tseries/hamlinux/
cp $1/rootfs.jffs2 $DESTDIR
cp $1/MLO $DESTDIR
cp $1/u-boot.img $DESTDIR
cp $1/zImage $DESTDIR
cp $1/*.dtb $DESTDIR


