# Gtk+ Makefile

NM= gtk+
VRS= 2.18.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnome.org/pub/gnome/sources/gtk+/2.18/gtk+-2.18.7.tar.bz2
SHA-$(FILE)= 92a40180ef4a097a867dc2eca1f209328581c5b3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
