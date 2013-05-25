# mpfr Makefile

NAME= mpfr
VRS= 2.4.2
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.mpfr.org/mpfr-2.4.2/mpfr-2.4.2.tar.bz2
SHA-$(FILE)= 7ca93006e38ae6e53a995af836173cf10ee7c18c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--enable-thread-safe
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
