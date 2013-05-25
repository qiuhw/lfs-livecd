# librsvg Makefile

NAME= librsvg
VER= 2.26.0
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnome.org/pub/GNOME/sources/librsvg/2.26/librsvg-2.26.0.tar.bz2
SUM-$(FILE)= 61044be4bcd5945f5711f788e1aa303a80b69e32

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--disable-gtk-doc \
		--disable-mozilla-plugin
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
