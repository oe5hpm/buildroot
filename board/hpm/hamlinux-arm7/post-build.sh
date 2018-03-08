#!/bin/bash
TARGETDIR=$1
BOARD_DIR="$( dirname "${0}" )"
MKIMAGE="${HOST_DIR}/bin/mkimage"


rm -r -f $TARGETDIR/root/

cp -r -f $BOARD_DIR/rootfs-additions/* $TARGETDIR/

echo "/bin/sh" >> $1/etc/shells

if [ $? -eq 0 ]; then
	echo "$0 done successfully."
else
	echo "$1 failed!"
fi

# factory cfg scripts
echo "generating config-scripts ..."
for i in $(ls $BOARD_DIR/cfgscr*); do
	OUTFILE=`echo ${BINARIES_DIR}/${i##*/} | cut -d . -f 1`
	echo "generating config-script for $i ..."
	"${MKIMAGE}" -C none -A arm -T script -d "${i}" "${OUTFILE}.img"
done

# boot script
"${MKIMAGE}" -C none -A arm -T script -d $BOARD_DIR/bootscr.txt ${BINARIES_DIR}/bootscr.img
