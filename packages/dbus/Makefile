# dbus Makefile

NAME= dbus
VER= 1.2.16
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://dbus.freedesktop.org/releases/dbus/dbus-1.2.16.tar.gz
SUM-$(FILE)= 28aa5c8839e60d82eb9ce934e3e244abdda913f7

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/dbus-1.0 \
		--localstatedir=/var
	make
	make install
	install -v -m755 -d /usr/share/doc/$(DIR)
	install -v -m644 doc/{TODO,*.{dtd,html,xml,xsl,txt,c}} \
	 /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
