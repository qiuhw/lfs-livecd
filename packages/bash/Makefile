NAME = bash
VER  = 4.2
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 3fb927c7c33022f1c327f14a81c0d4b0

PATCH = $(DIR)-fixes-12.patch
URL-$(PATCH) = http://www.linuxfromscratch.org/patches/lfs/development/$(PATCH)
SUM-$(PATCH) = 419f95c173596aea47a23d922598977a

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	patch -Np1 -i ../$(PATCH)
	./configure --prefix=/tools --without-bash-malloc
	make
	make install
	ln -s bash /tools/bin/sh

stage2: $(FILE)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure --prefix=/usr \
		--bindir=/bin \
		--htmldir=/usr/share/doc/$(DIR) \
		--without-bash-malloc \
		--with-installed-readline
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
