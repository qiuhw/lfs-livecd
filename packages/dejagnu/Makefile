# DejaGNU Makefile

NAME= dejagnu
DIR= $(NAME)-1.5.1
FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE)= 8386e04e362345f50ad169f052f4c4ab

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=/tools
	make install
	make check

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean
