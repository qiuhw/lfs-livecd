# Syslinux Makefile

NAME= syslinux
VER= 3.86
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= https://www.kernel.org/pub/linux/utils/boot/syslinux/3.xx/syslinux-3.86.tar.bz2
SUM-$(FILE)= 2d41043a3083c26e5e6bac3a5e8f17c3c0d963a1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) split-boot-help $(MY_ROOT)/doc/README.txt
	$(std_build)

compile-stage2:
	chmod +x ../split-boot-help
	install -dv /boot/isolinux
	cp -v core/isolinux.bin /boot/isolinux
	sed 's/\\_/_/g' $(MY_ROOT)/doc/README.txt | ../split-boot-help
	cp -v F*.txt /boot/isolinux
	cp -v $(MY_ROOT)/isolinux/{isolinux.cfg,boot.msg,splash.lss} /boot/isolinux

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
