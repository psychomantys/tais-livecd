

CLONEZILLA_VERSION='2.2.3-25'
CLONEZILLA="http://downloads.sourceforge.net/project/clonezilla/clonezilla_live_stable/${CLONEZILLA_VERSION}/clonezilla-live-${CLONEZILLA_VERSION}-i686-pae.zip"

wget -c "${CLONEZILLA}"

mkdir -p temp/clonezilla

unzip $( basename "${CLONEZILLA}" ) -d temp/clonezilla

mkdir -p root/clonezilla


cp temp/clonezilla/live/filesystem.packages \
	temp/clonezilla/live/initrd.img \
	temp/clonezilla/live/vmlinuz \
	root/clonezilla/


