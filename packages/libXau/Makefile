# libXau Makefile

NM= libXau
VRS= 1.0.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.x.org/pub/individual/lib/libXau-1.0.5.tar.bz2
SHA-$(FILE)= b1c68843edf7e80ce952f7ee0541448f41bac202

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
