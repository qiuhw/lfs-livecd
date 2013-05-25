# Gzip Makefile

NAME= gzip
VER= 1.4
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/gzip/gzip-1.4.tar.gz
SUM-$(FILE)= 1d398dac6a7920a7de6e2685fe472a840eb2ce6e

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
		--prefix=/usr \
		--bindir=/bin
	make
	make install
	mv -v /bin/{gzexe,uncompress,zcmp,zdiff,zegrep} /usr/bin
	mv -v /bin/{zfgrep,zforce,zgrep,zless,zmore,znew} /usr/bin

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
