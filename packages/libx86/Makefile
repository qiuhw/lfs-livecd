# libx86 Makefile

NAME= libx86
VER= 1.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.de.cw.net/pub/FreeBSD/ports/distfiles/libx86-1.1.tar.gz
SUM-$(FILE)= c55d8a428ab7f2084010c255aa8c666602544af9

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../libx86-1.1-lrmi_fix-1.patch
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
