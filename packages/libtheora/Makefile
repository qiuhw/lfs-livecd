# libtheora Makefile

NAME= libtheora
VER= 1.1.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2
SUM-$(FILE)= 8dcaa8e61cd86eb1244467c0b64b9ddac04ae262

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
