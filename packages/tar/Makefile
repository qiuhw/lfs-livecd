NAME = tar
VER  = 1.26
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.bz2
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 2cee42a2ff4f1cd4f9298eeeb2264519

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i -e '/gets is a/d' gnu/stdio.in.h
	./configure --prefix=/tools
	make
	make install

stage2: $(FILE)
	$(std_build)

compile-stage2:
	sed -i -e '/gets is a/d' gnu/stdio.in.h
	FORCE_UNSAFE_CONFIGURE=1 \
	./configure --prefix=/usr \
		--bindir=/bin \
		--libexecdir=/usr/sbin
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
