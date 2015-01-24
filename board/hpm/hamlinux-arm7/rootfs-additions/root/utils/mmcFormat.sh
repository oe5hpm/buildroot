#!/bin/sh
MMCMOUNTS=`df | grep mmcblk0 | cut -b 57-`

echo "y" > sure-we-want

for i in $MMCMOUNTS; do 
  umount $i
done

sfdisk < /root/mmc.layout /dev/mmcblk0 2>/dev/null
mkfs.ext4 /dev/mmcblk0p1 -L "ppt-boot" < sure-we-want 2>/dev/null
mkfs.ext4 /dev/mmcblk0p2 -L "ppt-sys" < sure-we-want 2>/dev/null
mkfs.ext4 /dev/mmcblk0p3 -L "ppt-config" < sure-we-want 2>/dev/null
mkfs.ext4 /dev/mmcblk0p4 -L "ppt-user" < sure-we-want 2>/dev/null

rm sure-we-want

if [ $? -eq 0 ]; then
  mount -a
  exit 0
else
  exit 1
fi


