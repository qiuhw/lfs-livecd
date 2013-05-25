# libnotify Makefile

NAME= libnotify
VRS= 0.4.4
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.galago-project.org/files/releases/source/libnotify/$(FILE)
SHA-$(FILE)= 24b86673c6673c72b9ad85a8082c884af26e9ce0

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
