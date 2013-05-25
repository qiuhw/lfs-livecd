# libtirpc Makefile

NAME= libtirpc
VER= 0.2.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://jaist.dl.sourceforge.net/project/libtirpc/libtirpc/0.2.1/libtirpc-0.2.1.tar.bz2
SHA-$(FILE)= ab0188be0eee162ad42cb941257e1615db5387c9

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
