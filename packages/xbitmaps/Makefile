# xbitmaps Makefile

NM= xbitmaps
VRS= 1.1.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 845b825f7e6d193d47db8b67ae8332d87ef8c2b3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
