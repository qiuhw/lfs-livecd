# Linux Kernel Makefile

NM= linux
VRS= 2.6.32.8
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 9f021c6f225ab01a39c1c474ab2dd8800e80976b

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
	create-initramfs $(CD_VERSION) $(VRS) /boot/isolinux/initramfs_data.cpio.gz
	sh ../debian-style-headers.sh

stage3: $(FILE)
	$(std_build)

compile-stage3:
	make mrproper
	cp ../config.x86_64 .config
	PATH=$$PATH:$(TT)/bin make ARCH=x86_64 CROSS_COMPILE=x86_64-unknown-linux-gnu-
	PATH=$$PATH:$(TT)/bin make ARCH=x86_64 CROSS_COMPILE=x86_64-unknown-linux-gnu- modules_install
	cp -v arch/x86_64/boot/bzImage /boot/isolinux/linux64
	create-initramfs $(CD_VERSION) $(VRS)-64bit /boot/isolinux/initramfs_data64.cpio.gz

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2 compile-stag3
