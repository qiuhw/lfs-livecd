# wireless_tools Makefile

NM= wireless_tools
VRS= 29
DIR= $(NM).$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 22040ac1497f4c5f8ddeca365591b01ae3475710

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make PREFIX=/usr
	make PREFIX=/usr INSTALL_MAN=/usr/share/man install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
