# LibIDL Makefile

NAME= libIDL
VER= 0.8.13
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnome.org/pub/gnome/sources/libIDL/0.8/libIDL-0.8.13.tar.bz2
SUM-$(FILE)= 14cab91ecd9428b86dfe4d831b1b0a325be16a5e

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
