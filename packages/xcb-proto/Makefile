# xcb-proto Makefile

NAME= xcb-proto
VER= 1.6
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://xcb.freedesktop.org/dist/xcb-proto-1.6.tar.bz2
SUM-$(FILE)= e82418557c7f59f29da9ec18e0906d6d78e3a164

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
