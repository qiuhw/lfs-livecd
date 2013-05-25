# libhangul Makefile

NAME= libhangul
VER= 0.0.10
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/libhangul-0.0.10.tar.gz
SUM-$(FILE)= 3fdbb1b4ea2f5f12bd3c6760bb2ad609e2eebbaa

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
