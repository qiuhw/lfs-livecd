# Libtool Makefile

NAME= libtool
VER= 2.2.6b
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/libtool/libtool-2.2.6b.tar.gz
SUM-$(FILE)= 5afa73c8ef9ebe64bbb438a0f8779c9036e43c55

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
