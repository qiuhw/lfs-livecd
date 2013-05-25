NAME = check
VER  = 0.9.10
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://sourceforge.net/projects/$(NAME)/files/$(NAME)/$(VER)/$(FILE)
SUM-$(FILE) = 6d10a8efb9a683467b92b3bce97aeb30

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=/tools
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean
