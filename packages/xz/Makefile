NAME = xz
VER  = 5.0.4
DIR  = $(NAME)-$(VER)

FILE = $(NAME)-$(VER).tar.xz
URL-$(FILE) = http://tukaani.org/$(NAME)/$(FILE)
SUM-$(FILE) = 161015c4a65b1f293d31810e1df93090

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
	./configure --prefix=/usr \
		--libdir=/lib \
		--docdir=/usr/share/doc/$(DIR)
	make
	make pkgconfigdir=/usr/lib/pkgconfig install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
