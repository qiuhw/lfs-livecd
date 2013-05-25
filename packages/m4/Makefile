NAME = m4
VER  = 1.4.16
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.bz2
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 8a7cef47fecab6272eb86a6be6363b2f

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i -e '/gets is a/d' lib/stdio.in.h
	./configure --prefix=/tools
	make
	make install

stage2: $(FILE)
	$(std_build)

compile-stage2:
	sed -i -e '/gets is a/d' lib/stdio.in.h
	./configure --prefix=/usr 
	make
	sed -i -e '41s/ENOENT/& || errno == EINVAL/' tests/test-readlink.h
	make check
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
