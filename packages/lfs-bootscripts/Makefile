# LFS-Bootscripts Makefile

NAME= lfs-bootscripts
VER= 20100124
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.linuxfromscratch.org/lfs/downloads/6.6/lfs-bootscripts-20100124.tar.bz2
SHA-$(FILE)= 2da7200b293983cc93a1ac6a6c2b5d093cd0b6f1

PATCH1= $(NAME)-livecd-2.patch

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	make install-livecd

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
