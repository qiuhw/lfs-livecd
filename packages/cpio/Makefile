# cpio Makefile

NM= cpio
VRS= 2.11
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 6f1934b0079dc1e85ddff89cabdf01adb3a74abb

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure CPIO_MT_PROG=mt --prefix=/usr --bindir=/bin \
	 --libexecdir=/tmp --with-rmt=/usr/sbin/rmt
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
