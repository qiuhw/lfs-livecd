# libvorbis Makefile

NAME= libvorbis
VRS= 1.2.3
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://downloads.xiph.org/releases/vorbis/libvorbis-1.2.3.tar.bz2
SHA-$(FILE)= 9b0ae094aebe75cee2d2bf3b7572deccab3746cb

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install
	install -v -m644 doc/Vorbis* /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
