# libusb Makefile

NAME= libusb
VER= 1.0.7
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-1.0.7/libusb-1.0.7.tar.bz2
SHA-$(FILE)= 8b7dd10dd9e86dbdefc80f42c923a5ecd9d3e2ef

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --disable-build-docs
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
