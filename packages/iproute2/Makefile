# Iproute2 Makefile

NM= iproute2
VRS= 2.6.31
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= e7dec62a4d6646f3fded4f5d34718e9fd98615e4

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build) 

compile-stage2:
	sed -i '/^TARGETS/s@arpd@@g' misc/Makefile
	make DESTDIR=
	make DESTDIR= SBINDIR=/sbin MANDIR=/usr/share/man \
	 DOCDIR=/usr/share/doc/$(DIR) install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
