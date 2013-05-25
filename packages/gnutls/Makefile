# gnutls Makefile

NAME= gnutls
VER= 2.8.6
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/gnutls/gnutls-2.8.6.tar.bz2
SUM-$(FILE)= bff911d4fd7389aa6698a644b3748eb2d23715bc

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
