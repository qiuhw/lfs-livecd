# libgcrypt Makefile

NAME= libgcrypt
VER= 1.4.5
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://mirrors.dotsrc.org/gcrypt/libgcrypt/libgcrypt-1.4.5.tar.bz2
SUM-$(FILE)= ef7ecbd3a03a7978094366bcd1257b3654608d28

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
