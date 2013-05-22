# ReiserFS Progs Makefile

NM= reiserfsprogs
VRS= 3.6.20
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 688b26c224769b46400e314c16f4185c55549e70

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sbindir=/sbin
	make
	make install
	ln -sf reiserfsck /sbin/fsck.reiserfs && \
	ln -sf mkreiserfs /sbin/mkfs.reiserfs

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
