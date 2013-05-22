# libXdmcp Makefile

NM= libXdmcp
VRS= 1.0.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 7efd71d29d6cfba797b8791398e4d81ade677d77

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
