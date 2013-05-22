# hdparm Makefile

NM= hdparm
VRS= 9.28
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= b320997655788e5cb658e643d82ddc2e30e187d4

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
