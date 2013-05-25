# man-pages-fr Makefile

NAME= man-pages-fr
VER= 3.03.0
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= ftp://ftp.ro.debian.org/pub/linux/distributions/frugalware/frugalware-1.6/source/locale-extra/man-pages-fr/man-pages-fr-3.03.0.tar.bz2
SUM-$(FILE)= de913b8cecba855b58f7bcc05a5c28c0d470c48b

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install
	
clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
