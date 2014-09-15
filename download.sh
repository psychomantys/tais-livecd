

CLONEZILLA_VERSION='2.2.3-25'
CLONEZILLA="http://downloads.sourceforge.net/project/clonezilla/clonezilla_live_stable/${CLONEZILLA_VERSION}/clonezilla-live-${CLONEZILLA_VERSION}-i686-pae.zip"

# http://www.hirensbootcd.org/download/
HIREN_VERSION='15.2'
HIREN="http://www.hirensbootcd.org/files/Hirens.BootCD.${HIREN_VERSION}.zip"

# http://gparted.org/download.php
GPARTED_VERSION='0.19.1-4'
GPARTED="http://downloads.sourceforge.net/project/gparted/gparted-live-stable/${GPARTED_VERSION}/gparted-live-${GPARTED_VERSION}-i486.iso"

wget -c "${CLONEZILLA}"

wget -c "${HIREN}"

wget -c "${GPARTED}"


# Clonezilla

mkdir -p temp/clonezilla

unzip $( basename "${CLONEZILLA}" ) -d temp/clonezilla

mkdir -p root/clonezilla


cp temp/clonezilla/live/filesystem.squashfs \
	temp/clonezilla/live/initrd.img \
	temp/clonezilla/live/vmlinuz \
	temp/clonezilla/live/filesystem.packages \
	temp/clonezilla/live/filesystem.packages-remove \
	root/clonezilla/

# Clonezilla end

# Gparted

mkdir -p root/gparted

7z x $( basename "${GPARTED}" ) -otemp/gparted

rsync -rav temp/gparted/live/* root/gparted/


# Gparted end

# Hiren

7z x $( basename "${HIREN}" ) -otemp/hiren

cp root/HBCD/isolinux.cfg temp/hiren/HBCD

rsync -rav temp/hiren/HBCD root/

# Hiren end

# pc check

cp pccheck*.iso /root/pccheck/pccheck.iso

# pc check end



