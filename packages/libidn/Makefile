# libidn Makefile

NAME= libidn
VER= 1.18
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/libidn/libidn-1.18.tar.gz
SUM-$(FILE)= 0b81360368e5100d1ec5261dea58fc72ef39ab6b

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
