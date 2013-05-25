# vbetool Makefile

NAME= vbetool
VER= 1.1
DIR= $(NAME)-$(VER)

FILE= $(NAME)-$(VER).tar.gz
URL-$(FILE)= ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/vbetool-1.1.tar.gz
SHA-$(FILE)= c7ba7c0635160c47fb1b94fd7c7cbe39cb717d22

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --with-x86emu
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
