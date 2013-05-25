# Mktemp Makefile

NAME= mktemp
VER= 1.5
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://cross-lfs.org/files/packages/1.1.0/mktemp-1.5.tar.gz
SUM-$(FILE)= aa001fd61d13bbf128dc58ca4dc6d83311435bae

PATCH1= $(DIR)-add_tempfile-3.patch
URL-$(PATCH1)= http://cross-lfs.org/files/packages/1.1.0/mktemp-1.5-add_tempfile-3.patch
SUM-$(PATCH1)= c4ca0c1d5993a44bf82c369d60f415e2cf92b95b

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(LFS)" $(chenv-pre-bash) \
	'cd $(ROOT) && make ch-$(NAME) $(chbash-pre-bash)'

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	./configure --prefix=/usr --with-libc
	make
	make install
	make install-tempfile

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
