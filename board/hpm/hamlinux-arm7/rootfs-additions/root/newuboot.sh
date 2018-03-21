#!/bin/sh
cd /tmp
[ -z $1 ] && echo "give tftp-server as argument!" && exit 1

tftp -g -r MLO $1
tftp -g -r u-boot.img $1

flash_erase /dev/mtd0 0 0
flash_erase /dev/mtd1 0 0
flash_erase /dev/mtd4 0 0

nandwrite -p /dev/mtd0 MLO
nandwrite -p /dev/mtd1 MLO
nandwrite -p /dev/mtd4 u-boot.img

