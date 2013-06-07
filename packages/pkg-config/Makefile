NAME = pkg-config
VER  = 0.23
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://pkgconfig.freedesktop.org/releases/pkg-config-0.23.tar.gz
SUM-$(FILE) = b59dddd6b5320bd74c0f74b3339618a327096b2a

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
