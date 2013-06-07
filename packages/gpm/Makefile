# GPM Makefile

NAME= gpm
VER= 1.20.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.schottelius.org/pub/linux/gpm/gpm-1.20.1.tar.bz2
SUM-$(FILE)= c48d937e62abb438c2f6439b34ef3332c89af8d1

PATCH1= $(DIR)-segfault-1.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/blfs/6.3/gpm-1.20.1-segfault-1.patch
SUM-$(PATCH1)= da53bf78a0ebaa5020e332aa6d6861159170ed86

PATCH2= $(DIR)-silent-1.patch
URL-$(PATCH2)= http://www.linuxfromscratch.org/patches/blfs/6.3/gpm-1.20.1-silent-1.patch
SUM-$(PATCH2)= 8899a212eadfbda201d8da3e44590bd05b97f9f6

PATCH3= $(DIR)-default_client-1.patch

# Targets

include $(ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1) $(PATCH2)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	patch -Np1 -i ../$(PATCH2)
	patch -Np1 -i ../$(PATCH3)
	./configure --prefix=/usr --sysconfdir=/etc --without-curses
	LDFLAGS="-lm" make
	make install
	cp conf/gpm-root.conf /etc
	/sbin/ldconfig

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
