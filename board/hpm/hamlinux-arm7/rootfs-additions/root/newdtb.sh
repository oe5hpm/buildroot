#!/bin/sh
cd /tmp
[ -z $1 ] && echo "give tftp-server as argument!" && exit 1
[ -z $2 ] && echo "give dtb-filename as 2nd argument!" && exit 1

ORDERNO=`cat /proc/device-tree/factory-settings/order-no`
DTBNAME=$2

if [ "$2" == "default" ]; then
	DTBNAME=`echo $ORDERNO.dtb`
fi
echo "using $DTBNAME ..."
tftp -g -r $DTBNAME $1

if [ $? -eq 0 ]; then
	flash_erase /dev/mtd2 0 0
	nandwrite -p /dev/mtd2 $DTBNAME
fi



