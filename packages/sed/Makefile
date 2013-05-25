NAME = sed
VER  = 4.2.2
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.bz2
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 7ffe1c7cdc3233e1e0c4b502df253974

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
		--bindir=/bin \
		--htmldir=/usr/share/doc/$(DIR)
	make
	make html
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
