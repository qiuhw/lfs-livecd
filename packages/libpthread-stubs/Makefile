# libpthread-stubs Makefile

NM= libpthread-stubs
VRS= 0.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://xcb.freedesktop.org/dist/libpthread-stubs-0.3.tar.bz2
SHA-$(FILE)= 7fc486ad0ec54938f8b781cc374218f50eac8b99

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
