# dhcpcd Makefile

NM= dhcpcd
VRS= 5.2.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 2739ea24091b3ede42b60affd3ea424dfa05686d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/dhcpcd \
		--sbindir=/sbin \
		--mandir=/usr/share/man \
		--dbdir=/var/lib/dhcpcd
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
