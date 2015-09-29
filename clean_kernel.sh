#!/bin/bash

echo "***** Setting up Environment *****";

. ./env_setup.sh || exit 1;

echo "${bldcya}***** Cleaning in Progress *****${txtrst}";

# clean major chunk
rm -rf $KERNELDIR/lettuce >> /dev/null;
rm -rf $KERNELDIR/tomato >> /dev/null;

# clean up kernel compiled binaries
make mrproper;
make clean;

# clean up generated files

rm -rf $INITRAMFS_TMP >> /dev/null;
rm -f $KERNELDIR/arch/arm64/boot/*.dtb >> /dev/null;
rm -f $KERNELDIR/arch/arm64/boot/*.cmd >> /dev/null;
rm -f $KERNELDIR/arch/arm64/boot/Image >> /dev/null;
rm -f $KERNELDIR/arch/arm64/boot/Image.gz >> /dev/null;
rm -f $KERNELDIR/arch/arm64/boot/Image.gz-dtb >> /dev/null;
rm -f $KERNELDIR/arch/arm64/mach-msm/smd_rpc_sym.c >> /dev/null;
rm -f $KERNELDIR/arch/arm64/crypto/aesbs-core.S >> /dev/null;
rm -f $KERNELDIR/r*.cpio >> /dev/null;
rm -f $KERNELDIR/ramdisk* >> /dev/null;
rm -rf $KERNELDIR/include/generated >> /dev/null;
rm -rf $KERNELDIR/arch/*/include/generated >> /dev/null;
rm -f $KERNELDIR/Image.gz >> /dev/null;
rm -f $KERNELDIR/Image >> /dev/null;
rm -f $KERNELDIR/out/Image.gz >> /dev/null;
rm -f $KERNELDIR/Image.gz-dtb >> /dev/null;
rm -f $KERNELDIR/out/*.img >> /dev/null;
rm -rf $KERNELDIR/out/boot >> /dev/null;
rm -f $KERNELDIR/*.img >> /dev/null;
rm -f $KERNELDIR/dt.img >> /dev/null;
rm -rf $KERNELDIR/out/system/lib/modules >> /dev/null;
rm -rf $KERNELDIR/out/tmp_modules >> /dev/null;
rm -f $KERNELDIR/out/*.zip >> /dev/null;
rm -rf $KERNELDIR/tmp >> /dev/null;

# clean up leftover junk
find . -type f \( -iname \*.rej \
				-o -iname \*.orig \
				-o -iname \*.bkp \
				-o -iname \*.ko \
				-o -iname \*.c.BACKUP.[0-9]*.c \
				-o -iname \*.c.BASE.[0-9]*.c \
				-o -iname \*.c.LOCAL.[0-9]*.c \
				-o -iname \*.c.REMOTE.[0-9]*.c \
				-o -iname \*.org \) \
					| parallel rm -fv {};

echo "${bldcya}***** Cleaning Done *****${txtrst}";
