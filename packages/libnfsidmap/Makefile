# libnfsidmap Makefile

NAME= libnfsidmap
VER= 0.23
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/libnfsidmap-0.23.tar.gz
SHA-$(FILE)= bd9647582f7d863a483460815f0a0b1450884c3d

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
