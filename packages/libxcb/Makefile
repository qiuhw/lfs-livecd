# libxcb Makefile

NAME= libxcb
VER= 1.6
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://xcb.freedesktop.org/dist/libxcb-1.6.tar.bz2
SUM-$(FILE)= b0a6fec4c02ec876f32bbd4b64ffe8a25f0da518

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc \
	 --mandir=/usr/share/man --localstatedir=/var \
	 --docdir=/usr/share/doc/$(DIR)
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
