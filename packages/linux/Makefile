# Linux Kernel Makefile

NAME= linux
VER= 2.6.32.8
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.32.8.tar.bz2
SUM-$(FILE)= 9f021c6f225ab01a39c1c474ab2dd8800e80976b

# Targets

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	install -dv /boot/isolinux
	make mrproper
	cp ../config.x86 .config
	make
	make modules_install
	cp -v arch/i386/boot/bzImage /boot/isolinux/linux
	create-initramfs $(CD_VERSION) $(VER) /boot/isolinux/initramfs_data.cpio.gz
	sh ../debian-style-headers.sh

stage3: $(FILE)
	$(std_build)

compile-stage3:
	make mrproper
	cp ../config.x86_64 .config
	PATH=$$PATH:/tools/bin make ARCH=x86_64 CROSS_COMPILE=x86_64-unknown-linux-gnu-
	PATH=$$PATH:/tools/bin make ARCH=x86_64 CROSS_COMPILE=x86_64-unknown-linux-gnu- modules_install
	cp -v arch/x86_64/boot/bzImage /boot/isolinux/linux64
	create-initramfs $(CD_VERSION) $(VER)-64bit /boot/isolinux/initramfs_data64.cpio.gz

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2 compile-stag3
