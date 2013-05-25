# Lynx Makefile

NAME= lynx
VER= 2.8.7rel.1
DIR= $(NAME)2-8-7

FILE= $(NAME)$(VER).tar.bz2
URL-$(FILE)= http://lynx.isc.org/current/lynx2.8.7rel.1.tar.bz2
SUM-$(FILE)= f5e67a298322b22fe0edcfba326c02eaa5edcb72

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc/lynx \
	 --datadir=/usr/share/doc/$(NAME)-$(VER) --with-zlib --with-bzlib \
	 --with-screen=ncursesw --enable-locale-charset
	make
	make install-full
	chgrp -v -R root /usr/share/doc/$(NAME)-$(VER)/lynx_doc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
