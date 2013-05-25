# dmraid Makefile

NAME= dmraid
VER= 1.0.0.rc16
DIR= $(NAME)

FILE= $(NAME)-$(VER).tar.bz2
URL-$(FILE)= http://repository.timesys.com/buildsources/d/dmraid/dmraid-1.0.0.rc16/dmraid-1.0.0.rc16.tar.bz2
SHA-$(FILE)= 99e76332bb03c5a79406e3c8cb12b6746288635d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cd $(VER) ; ./configure --prefix=/usr
	# This package doesn't like parallel build
	cd $(VER) ; make
	cd $(VER) ; make install

clean:
	-rm -rf $(NAME)

.PHONY: clean compile-stage2
