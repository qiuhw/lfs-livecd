# NFS Utilities Makefile

NM= nfs-utils
VRS= 1.2.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= bf823cb85844de3ff3bf07601698aaa1cfdd8a28

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--disable-gss
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
