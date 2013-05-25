# BRLTTY Makefile

NAME= brltty
VER= 4.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/brltty-4.2.tar.gz
SHA-$(FILE)= d25802d08599b75841e7bb2f29bc88737f2992d2

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc --disable-api
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
