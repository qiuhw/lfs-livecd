# libusb-compat Makefile

NAME= libusb-compat
VER= 0.1.3
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/libusb-compat-0.1.3/libusb-compat-0.1.3.tar.bz2
SUM-$(FILE)= d5710d5bc4b67c5344e779475b76168c7ccc5e69

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
