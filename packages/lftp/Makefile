# lftp Makefile

NAME= lftp
VRS= 3.5.11
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.kanshima.net/mirrors/lftp/$(FILE)
SHA-$(FILE)= d9a3add50667cbdf98ee765d521b77f628612c0d

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(LFS)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NAME) $(chbash-post-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
