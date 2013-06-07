# libsexy Makefile

NAME= libsexy
VER= 0.1.11
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://releases.chipx86.com/libsexy/libsexy/$(FILE)
SUM-$(FILE)= be01c58f8888556660a847aa901a08c38a45fd96

# Targets

include $(ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
