# pidgin Makefile

NM= pidgin
VRS= 2.6.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= d74459152f9598139a3fd8aee385e3366722155c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--disable-gtkspell \
		--disable-vv \
		--disable-meanwhile \
		--disable-avahi \
		--disable-nm \
		--disable-tcl
	make
	make install
	rsync -azv --exclude .svn $(MY_ROOT)/root/.purple /root/

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
