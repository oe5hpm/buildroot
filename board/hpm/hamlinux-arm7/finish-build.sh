#!/bin/bash
cp $1/rootfs.cpio.uboot /tftpboot/tseries
[ -f $1/PPTImage.img.gz ] && rm $1/PPTImage.img.gz
cp $1/rootfs.ext4.gz $1/PPTImage.img.gz
pushd $1 >/dev/null
md5sum PPTImage.img.gz > PPTImage.md5
popd > /dev/null

