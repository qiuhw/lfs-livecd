# dbus-glib Makefile

NM= dbus-glib
VRS= 0.82
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 8ad09cf13810382048a685bcafc72f252b2539a8

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/dbus-1.0/dbus-1
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
