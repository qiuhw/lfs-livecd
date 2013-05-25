# libsexy Makefile

NAME= libsexy
VRS= 0.1.11
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://releases.chipx86.com/libsexy/libsexy/$(FILE)
SHA-$(FILE)= be01c58f8888556660a847aa901a08c38a45fd96

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(LFS)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NAME) $(chbash-post-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
