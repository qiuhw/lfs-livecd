# libevent Makefile

NAME= libevent
VRS= 1.4.13-stable
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/levent/files/libevent/libevent-1.4/libevent-1.4.13-stable.tar.gz
SHA-$(FILE)= b0c4e9801b74f8bed1502353674288a5e4f1ca16

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
