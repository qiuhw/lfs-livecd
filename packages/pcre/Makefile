# PCRE Makefile

NM= pcre
VRS= 8.02
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 2cf2f7f04988813c7ce45c43eb934f3b8b1c3b34

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--docdir=/usr/share/doc/$(DIR) \
	 	--enable-utf8 \
	 	--enable-unicode-properties \
	 	--enable-pcregrep-libz \
	 	--enable-pcregrep-libbz2
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
