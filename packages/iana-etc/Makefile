# Iana-etc Makefile

NM= iana-etc
VRS= 2.30
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 218593bcb9264014c4e397d838b2c218eac9df06

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
