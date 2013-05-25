# libchewing Makefile

NAME= libchewing
VRS= 0.3.2
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://chewing.googlecode.com/files/libchewing-0.3.2.tar.bz2
SHA-$(FILE)= 23eb09ab17c432cefb8cf42c758106b71b50d55f

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
