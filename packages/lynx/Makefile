# Lynx Makefile

NM= lynx
VRS= 2.8.7rel.1
DIR= $(NM)2-8-7

FILE= $(NM)$(VRS).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= f5e67a298322b22fe0edcfba326c02eaa5edcb72

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc/lynx \
	 --datadir=/usr/share/doc/$(NM)-$(VRS) --with-zlib --with-bzlib \
	 --with-screen=ncursesw --enable-locale-charset
	make
	make install-full
	chgrp -v -R root /usr/share/doc/$(NM)-$(VRS)/lynx_doc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
