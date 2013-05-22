# libusb Makefile

NM= libusb
VRS= 1.0.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 8b7dd10dd9e86dbdefc80f42c923a5ecd9d3e2ef

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --disable-build-docs
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
