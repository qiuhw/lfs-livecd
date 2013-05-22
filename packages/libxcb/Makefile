# libxcb Makefile

NM= libxcb
VRS= 1.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= b0a6fec4c02ec876f32bbd4b64ffe8a25f0da518

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc \
	 --mandir=/usr/share/man --localstatedir=/var \
	 --docdir=/usr/share/doc/$(DIR)
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
