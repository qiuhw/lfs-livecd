# hal Makefile

NM= hal
VRS= 0.5.14
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 95bdc8141b0bce197d0d47f5bec491b08c6e3853

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
	    --libexecdir=/usr/lib/hal \
	    --enable-policy-kit=no
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
