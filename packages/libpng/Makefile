# libpng Makefile

NAME= libpng
VER= 1.2.42
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.lfs-matrix.net/pub/blfs/conglomeration/libpng/libpng-1.2.42.tar.bz2
SUM-$(FILE)= e41cea7a6f5e3065f4289de3742db87ded05b99d

PATCH= $(DIR)-apng-1.patch
URL-$(PATCH)= http://lfs-matrix.net/patches/downloads/libpng/libpng-1.2.42-apng-1.patch
SUM-$(PATCH)= aab6f1e4a275bed05c0dacf1146fe656772f0482

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
