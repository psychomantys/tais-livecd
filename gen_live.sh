#!/bin/bash

root=$1
output=$2


mkisofs -o "${output}" -R \
	-b boot/syslinux/isolinux.bin -c boot/syslinux/boot.cat \
	-no-emul-boot -boot-load-size 4 -boot-info-table \
	"${root}"




