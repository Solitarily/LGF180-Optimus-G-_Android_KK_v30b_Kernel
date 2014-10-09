#!/sbin/sh
# anykernel.sh

cd /data/tmp/anykernel

# add usbdisk support to ramdisk
echo Modifying ramdisk...
dd if=/dev/block/platform/msm_sdcc.1/by-name/boot of=boot.img
chmod 755 unpackbootimg
./unpackbootimg -i boot.img
mkdir ramdisk
cd ramdisk
gzip -dc ../boot.img-ramdisk.gz | cpio -i
find . | cpio --create --format='newc' | gzip > ../ramdisk.gz
cd ..

echo \#!/sbin/sh > createnewboot.sh
echo ./mkbootimg --kernel zImage --ramdisk ramdisk.gz --cmdline \"$(cat boot.img-cmdline)\" --base 0x$(cat boot.img-base) --pagesize 2048 --ramdiskaddr 0x82200000 --output newboot.img >> createnewboot.sh
chmod 755 createnewboot.sh
chmod 755 mkbootimg
./createnewboot.sh

echo Flashing boot.img...
dd if=newboot.img of=/dev/block/platform/msm_sdcc.1/by-name/boot

# cleanup
cd ..
rm -rf anykernel
rm -f anykernel.sh

exit 0
