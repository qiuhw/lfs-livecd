# libgpg-error Makefile

NM= libgpg-error
VRS= 1.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= bf8c6babe1e28cae7dd6374ca24ddcc42d57e902

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install
	install -v -m644 -D README /usr/share/doc/$(DIR)/README

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
