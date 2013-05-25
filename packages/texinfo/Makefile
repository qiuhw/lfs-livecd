NAME = texinfo
VER  = 5.1
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 52ee905a3b705020d2a1b6ec36d53ca6

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
	make TEXMF=/usr/share/texmf install-tex

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
