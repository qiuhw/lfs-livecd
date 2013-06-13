NAME = gzip
VER  = 1.6
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = da981f86677d58a106496e68de6f8995

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
