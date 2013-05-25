# Grub Makefile

NAME= grub
VRS= 1.97.2
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://alpha.gnu.org/gnu/grub/grub-1.97.2.tar.gz
SHA-$(FILE)= 90aca596add560afeb9f2a829421dfd360d4c725

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	mkdir build
	cd build ; ../configure --prefix=/usr \
    	--sysconfdir=/etc \
    	--disable-grub-emu \
    	--disable-grub-emu-usb \
		--disable-grub-fstest \
		--disable-efiemu
	cd build ; make
	cd build ; make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
