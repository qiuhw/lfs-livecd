# LibXML2 Makefile

NAME= libxml2
VER= 2.7.7
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://xmlsoft.org/sources/libxml2-2.7.7.tar.gz
SUM-$(FILE)= 8592824a2788574a172cbddcdc72f734ff87abe3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --with-history
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
