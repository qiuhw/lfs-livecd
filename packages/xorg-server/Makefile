# xorg-server Makefile

NM= xorg-server
VRS= 1.7.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= d31e259b3ab975e2c1baea8f7310b57152ae3c62

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--localstatedir=/var \
	 	--with-module-dir=/usr/lib/X11/modules \
	 	--with-xkb-output=/var/lib/xkb \
	 	--enable-install-setuid
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
