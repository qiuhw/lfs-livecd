# FreeType Makefile

NM= freetype
VRS= 2.3.12
DIR= $(NM)-$(VRS)
	 
FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= ebf0438429c0bedd310059326d91646c3c91016b

FILE2= $(NM)-doc-$(VRS).tar.bz2
URL-$(FILE2)= $(HTTP)/$(NM)/$(FILE2)
SHA-$(FILE2)= 4f3b2d0f04f23d5430dac4252fc225831c29dd18

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE2)
	$(std_build)

compile-stage2:
	tar --strip-components=2 -xvf ../$(FILE2) -C docs
	sed -i -r -e 's:.*(#.*BYTE.*) .*:\1:' -e 's:.*(#.*SUBPIX.*) .*:\1:' \
	 include/freetype/config/ftoption.h
	./configure --prefix=/usr
	make
	make install
	install -v -m755 -d /usr/share/doc/$(DIR)
	cp -v -R docs/* /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
