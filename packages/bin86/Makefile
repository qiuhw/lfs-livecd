NAME = bin86
VER  = 0.16.17
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://ftp.nux.at/pub/dev86/$(FILE)
SUM-$(FILE) = 656f06b4b26d08412132e338baa25e42d713eeec

PATCH = $(DIR)-x86_64-1.patch
URL-$(PATCH) = http://svn.cross-lfs.org/svn/repos/cross-lfs/trunk/patches/$(PATCH)
SUM-$(PATCH) = 2c967c062fbee4e40ca1bf55feec2033e132e0a9

include $(ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	make PREFIX=/usr MANDIR=/usr/share/man/man1
	make PREFIX=/usr MANDIR=/usr/share/man/man1 install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
