# bin86 Makefile

NAME= bin86
VER= 0.16.17
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.nux.at/pub/dev86/$(FILE)
SHA-$(FILE)= 656f06b4b26d08412132e338baa25e42d713eeec

PATCH= $(DIR)-x86_64-1.patch
URL-$(PATCH)= http://svn.cross-lfs.org/svn/repos/cross-lfs/trunk/patches/$(PATCH)
SHA-$(PATCH)= 2c967c062fbee4e40ca1bf55feec2033e132e0a9

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(LFS)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NAME) $(chbash-post-bash)'

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
ifeq ($(CD_ARCH),x86_64)
	patch -Np1 -i ../$(PATCH)
endif
	make PREFIX=/usr MANDIR=/usr/share/man/man1
	make PREFIX=/usr MANDIR=/usr/share/man/man1 install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean chroot compile-stage2
