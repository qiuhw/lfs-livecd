# libtiff Makefile

NAME= tiff
VER= 3.9.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://download.osgeo.org/libtiff/tiff-3.9.2.tar.gz
SHA-$(FILE)= 5c054d31e350e53102221b7760c3700cf70b4327

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
