# luit Makefile

NAME= luit
VER= 1.0.4
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.x.org/pub/individual/app/luit-1.0.4.tar.bz2
SUM-$(FILE)= d5f1326017c0cebf62e7e7df2703b3b4998a39bd

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
