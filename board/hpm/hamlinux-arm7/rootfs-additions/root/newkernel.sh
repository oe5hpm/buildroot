#!/bin/sh
cd /tmp
[ -z $1 ] && echo "give tftp-server as argument!" && exit 1

tftp -g -r zImage $1

flash_erase /dev/mtd5 0 0
nandwrite -p /dev/mtd5 zImage


