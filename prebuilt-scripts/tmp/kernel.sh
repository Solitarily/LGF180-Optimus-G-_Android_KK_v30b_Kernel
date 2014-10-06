#!/sbin/sh
# kernel.sh

cd /data/tmp/kernel

# add usbdisk support to ramdisk
echo Modifying ramdisk...
dd if=/dev/block/platform/msm_sdcc.1/by-name/boot of=boot.img
chmod 755 unpackbootimg
./unpackbootimg -i boot.img
mkdir ramdisk
cd ramdisk
gzip -dc ../boot.img-ramdisk.gz | cpio -i
cd ..
./mkbootfs ./ramdisk | ./minigzip > ramdisk.img

echo \#!/sbin/sh > createnewboot.sh

echo ./mkbootimg --cmdline \"$(cat boot.img-cmdline)\" --base $(cat boot.img-base) --pagesize $(cat boot.img-pagesize) --ramdisk_offset $(cat boot.img-ramdisk_offset) --kernel zImage --ramdisk ramdisk.img -o newboot.img >> createnewboot.sh
chmod 755 createnewboot.sh
chmod 755 mkbootimg
./createnewboot.sh

echo Flashing boot.img...
dd if=newboot.img of=/dev/block/platform/msm_sdcc.1/by-name/boot

# cleanup
cd ..
rm -rf kernel

exit 0
