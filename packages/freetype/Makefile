# FreeType Makefile

NAME= freetype
VER= 2.3.12
DIR= $(NAME)-$(VER)
	 
FILE= $(DIR).tar.bz2
URL-$(FILE)= http://download.savannah.gnu.org/releases/freetype/freetype-old/freetype-2.3.12.tar.bz2
SUM-$(FILE)= ebf0438429c0bedd310059326d91646c3c91016b

FILE2= $(NAME)-doc-$(VER).tar.bz2
URL-$(FILE2)= http://download.savannah.gnu.org/releases/freetype/freetype-old/freetype-doc-2.3.12.tar.bz2
SUM-$(FILE2)= 4f3b2d0f04f23d5430dac4252fc225831c29dd18

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
