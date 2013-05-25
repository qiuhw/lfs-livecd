NAME = zlib
VER  = 1.2.8
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://www.zlib.net/$(FILE)
SUM-$(FILE) = 28f1205d8dd2001f26fec1e8c2cebe37

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=/tools
	make
	make install

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install
	mv /usr/lib/libz.so.* /lib
	ln -sf ../../lib/libz.so.$(VER) /usr/lib/libz.so

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
