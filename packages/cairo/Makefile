# cairo Makefile

NAME= cairo
VER= 1.8.10
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.cairographics.org/releases/cairo-1.8.10.tar.gz
SUM-$(FILE)= fd5e8ca82ff0e8542ea4c51612cad387f2a49df3

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
