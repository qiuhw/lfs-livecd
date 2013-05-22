# Autoconf Makefile

NM= autoconf
VRS= 2.65
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 9126ffb8d7d59f38f305ef53e208531d4b75bb87

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR) 

.PHONY: clean compile-stage2
