# xkeyboard-config Makefile

NM= xkeyboard-config
VRS= 1.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= d6df43bfc0596be04865f2be7c4e794e198358c8

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var \
	 --with-xkb-rules-symlink=xorg
	make
	make install
	install -dv -m755 /usr/share/doc/$(DIR)
	install -v -m644 docs/{README,HOWTO}* /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
