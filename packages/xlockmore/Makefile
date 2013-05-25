# xlockmore Makefile

NAME= xlockmore
VER= 5.30
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.tux.org/~bagleyd/xlock/xlockmore-5.30/xlockmore-5.30.tar.bz2
SHA-$(FILE)= 960f711a75d9f0a2e30873443386a9d3cd46c3c6

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
