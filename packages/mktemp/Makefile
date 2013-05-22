# Mktemp Makefile

NM= mktemp
VRS= 1.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= aa001fd61d13bbf128dc58ca4dc6d83311435bae

PATCH1= $(DIR)-add_tempfile-3.patch
URL-$(PATCH1)= $(HTTP)/$(NM)/$(PATCH1)
SHA-$(PATCH1)= c4ca0c1d5993a44bf82c369d60f415e2cf92b95b

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-pre-bash) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-pre-bash)'

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
