# slang Makefile

NAME= slang
VER= 2.2.2
DIR= $(NAME)-$(VER)

FILE= $(NAME)-$(VER).tar.bz2
URL-$(FILE)= ftp://109.106.1.82/pub/FreeBSD/ports/distfiles/slang-2.2.2.tar.bz2
SUM-$(FILE)= 13bb6344f71779cad8c05e1b6b1ef2d073888d58

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make elf
	make install-elf
	chmod -v 755 /usr/lib/libslang.so.$(VER)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
