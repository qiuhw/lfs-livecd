# Flex Makefile

NM= flex
VRS= 2.5.35
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= c507095833aaeef2d6502e12638e54bf7ad2f24a

PATCH= $(DIR)-gcc44-1.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
SHA-$(PATCH)= 68ac2b16f2710f9c3bf1e3e90ad833b6f554afe2

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure \
		--prefix=/usr
	make
	make install
	ln -sfv libfl.a /usr/lib/libl.a
	echo "#!/bin/sh" > /usr/bin/lex
	echo "# Begin /usr/bin/lex" >> /usr/bin/lex
	echo "" >> /usr/bin/lex
	echo "exec /usr/bin/flex -l \"\$$@\"" >> /usr/bin/lex
	echo "" >> /usr/bin/lex
	echo "# End /usr/bin/lex" >> /usr/bin/lex
	chmod 755 /usr/bin/lex

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
