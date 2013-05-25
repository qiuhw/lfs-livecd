NAME = diffutils
VER  = 3.3
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 99180208ec2a82ce71f55b0d7389f1b3

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
	make check
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
