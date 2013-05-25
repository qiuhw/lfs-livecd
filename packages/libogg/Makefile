# libogg Makefile

NAME= libogg
VER= 1.1.4
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://downloads.xiph.org/releases/ogg/libogg-1.1.4.tar.gz
SUM-$(FILE)= 868ace372004cf303231b954c60a836acbd71065

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
