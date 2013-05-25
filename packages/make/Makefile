NAME = make
VER  = 3.82
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.bz2
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 1a11100f3c63fcf5753818e59d63088f

PATCH = $(DIR)-upstream_fixes-3.patch
URL-$(PATCH) = http://www.linuxfromscratch.org/patches/lfs/development/$(PATCH)
SUM-$(PATCH) = 95027ab5b53d01699845d9b7e1dc878d

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=/tools
	make
	make install

stage2: $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure --prefix=/usr
	make
	make check
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
