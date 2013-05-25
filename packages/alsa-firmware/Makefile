# alsa-firmware Makefile

NAME= alsa-firmware
VER= 1.0.20
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://alsa.cybermirror.org/firmware/alsa-firmware-1.0.20.tar.bz2
SHA-$(FILE)= 184742e14c5edcbea8da01db7c9e96b9d0bd3678

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i s/multisound// Makefile.in
	./configure --prefix=/usr --disable-loader
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
