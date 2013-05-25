# libwnck Makefile

NAME= libwnck
VER= 2.28.0
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= ftp://ftp.mirrorservice.org/sites/ftp.gnome.org/pub/GNOME/desktop/2.28/2.28.0/sources/libwnck-2.28.0.tar.bz2
SHA-$(FILE)= 20158519615d10d14a415d8f0d5b39375350eb81

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
