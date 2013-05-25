NAME = grep
VER  = 2.14
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = d4a3f03849d1e17ce56ab76aa5a24cab

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
		--bindir=/bin
	make
	make check
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
