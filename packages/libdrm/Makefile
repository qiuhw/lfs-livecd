# libdrm Makefile

NAME= libdrm
VER= 2.4.14
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://dri.freedesktop.org/libdrm/libdrm-2.4.14.tar.bz2
SHA-$(FILE)= a18cc2cdfd02b8ba1c91c3e9ac609521ad3e2fe9

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
