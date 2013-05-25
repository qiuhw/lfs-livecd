# Texinfo Makefile

NAME= texinfo
VER= 4.13a
DIR= $(NAME)-4.13

FILE= $(DIR)a.tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/texinfo/texinfo-4.13a.tar.gz
SUM-$(FILE)= a1533cf8e03ea4fa6c443b73f4c85e4da04dead0

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=/tools
	make
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install
	make TEXMF=/usr/share/texmf install-tex

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
