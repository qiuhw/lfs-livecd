NAME = automake
VER  = 1.13.3
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = e181a81bb57097a6c8c52cdb91c4b2b9

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr \
		--docdir=/usr/share/doc/$(DIR)
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
