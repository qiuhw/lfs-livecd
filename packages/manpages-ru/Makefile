# manpages-ru Makefile

NAME= manpages-ru
VER= 0.98
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/manpages-ru-0.98.tar.bz2
SUM-$(FILE)= b5eb5ae4eaa7abc7e4065cf7286efc03106379a1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cp -r man? /usr/share/man/ru

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
