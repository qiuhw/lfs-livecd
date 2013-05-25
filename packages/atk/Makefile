# ATK Makefile

NAME= atk
VRS= 1.28.0
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnome.org/pub/gnome/sources/atk/1.28/atk-1.28.0.tar.bz2
SHA-$(FILE)= 4cf9c171f5b305453396501b4c29a68ab3a9ec89

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
