# PCI Utilities Makefile

NM= pciutils
VRS= 3.1.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 58336ef8c1bbe870f2cc0ed9481a8cf8a58e039c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/null ;/null 2>\&1 ;/' update-pciids.sh
	make PREFIX=/usr
	make PREFIX=/usr install
	install -m 755 -d /usr/include/pci
	install -m 644 lib/*.h /usr/include/pci
	install -m 644 lib/libpci.a /usr/lib
	update-pciids
	rm -f /usr/share/pci.ids.gz.old
	gunzip /usr/share/pci.ids.gz

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
