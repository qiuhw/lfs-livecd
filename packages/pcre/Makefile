# PCRE Makefile

NAME= pcre
VER= 8.02
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/pcre/files/pcre/8.02/pcre-8.02.tar.bz2
SUM-$(FILE)= 2cf2f7f04988813c7ce45c43eb934f3b8b1c3b34

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--docdir=/usr/share/doc/$(DIR) \
	 	--enable-utf8 \
	 	--enable-unicode-properties \
	 	--enable-pcregrep-libz \
	 	--enable-pcregrep-libbz2
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
