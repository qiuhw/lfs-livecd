# xbitmaps Makefile

NAME= xbitmaps
VER= 1.1.0
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.x.org/pub/individual/data/xbitmaps-1.1.0.tar.bz2
SUM-$(FILE)= 845b825f7e6d193d47db8b67ae8332d87ef8c2b3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
