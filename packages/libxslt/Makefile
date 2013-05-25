# libxslt Makefile

NAME= libxslt
VER= 1.1.26
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://xmlsoft.org/sources/libxslt-1.1.26.tar.gz
SUM-$(FILE)= 69f74df8228b504a87e2b257c2d5238281c65154

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
