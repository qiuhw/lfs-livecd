# device-mapper Makefile

NM= device-mapper
VRS= 1.02.21
DIR= $(NM).$(VRS)

FILE= $(DIR).tgz
URL-$(FILE)= ftp://sources.redhat.com/pub/dm/$(FILE)
SHA-$(FILE)= b9ce3e5400cf66e2b5b2eebc672268360c371692

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
