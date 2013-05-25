# synaptics Makefile

NAME= synaptics
VRS= 0.14.6
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://web.telia.com/~u89404340/touchpad/files/$(FILE)
SHA-$(FILE)= 41443e253e73546657b40435c8c9bfa0a91662bc

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(LFS)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NAME) $(chbash-post-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make PREFIX=/usr MANDIR=/usr/share/man
	make PREFIX=/usr MANDIR=/usr/share/man install

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
