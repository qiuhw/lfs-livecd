# jfsutils Makefile

NM= jfsutils
VRS= 1.1.11
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://jfs.sourceforge.net/project/pub/$(FILE)
SHA-$(FILE)= 27837760bd65f32758d6048803387b8b3443467f

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sbindir=/sbin
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
