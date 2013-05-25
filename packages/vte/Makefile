# vte Makefile

NAME= vte
VER= 0.22.5
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnome.org/mirror/gnome.org/sources/vte/0.22/vte-0.22.5.tar.bz2
SUM-$(FILE)= c9dd126991cf6d50ac3c678c0e117a5b2fefc180

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i -e 's%\\177:%&kh=\\EOH:@7=\\EOF:%g' termcaps/xterm
	./configure --prefix=/usr --libexecdir=/usr/sbin
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
