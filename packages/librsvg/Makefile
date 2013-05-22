# librsvg Makefile

NM= librsvg
VRS= 2.26.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 61044be4bcd5945f5711f788e1aa303a80b69e32

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
