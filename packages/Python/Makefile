# Python Makefile

NAME= Python
VER= 2.6.5
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.python.org/ftp/python/2.6.5/Python-2.6.5.tar.bz2
SUM-$(FILE)= 24c94f5428a8c94c9d0b316e3019fee721fdb5d1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--enable-shared
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
