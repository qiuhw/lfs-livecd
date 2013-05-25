# Pango Makefile

NAME= pango
VER= 1.26.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnome.org/pub/gnome/sources/pango/1.26/pango-1.26.2.tar.bz2
SUM-$(FILE)= 051b6f7b5f98a4c8083ef6a5178cb5255a992b98

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
