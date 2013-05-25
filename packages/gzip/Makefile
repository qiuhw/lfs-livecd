NAME = gzip
VER  = 1.5
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 2a431e169b6f62f7332ef6d47cc53bae

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
	mv /bin/{gzexe,uncompress,zcmp,zdiff,zegrep} /usr/bin
	mv /bin/{zfgrep,zforce,zgrep,zless,zmore,znew} /usr/bin

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
