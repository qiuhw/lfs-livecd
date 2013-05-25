# libgpg-error Makefile

NAME= libgpg-error
VER= 1.7
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://mirrors.dotsrc.org/gcrypt/libgpg-error/libgpg-error-1.7.tar.bz2
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
