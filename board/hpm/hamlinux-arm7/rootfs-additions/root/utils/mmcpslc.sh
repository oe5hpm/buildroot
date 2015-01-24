#!/bin/sh
DEV=/dev/mmcblk0
MMCUTIL=mmc
SIZ=`$MMCUTIL extcsd read $DEV | grep "i.e. " | grep KiB | cut -d " " -f 3`
CNT=0

for i in $SIZ; do
	if [ $CNT -eq 2 ]; then
		SIZ=$i
		break;
	fi
	CNT=`expr $CNT + 1`
done

echo "setting enhanced area to $SIZ KiB on $DEV"
$MMCUTIL enh_area set -y 0 $SIZ $DEV 2>&1 

echo "activating background operations."
$MMCUTIL bkops enable $DEV

echo "done !"
exit 0

