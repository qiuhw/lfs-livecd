# Glib Makefile

NAME= glib
VER= 2.25.3
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= https://launchpad.net/glib/head/2.25.3/+download/glib-2.25.3.tar.bz2
SHA-$(FILE)= 5a8cf17c44decb27de3fbc202be05c89d55f647d

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
