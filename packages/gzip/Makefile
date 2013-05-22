# Gzip Makefile

NM= gzip
VRS= 1.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 1d398dac6a7920a7de6e2685fe472a840eb2ce6e

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build) 

compile-stage1:
	./configure \
		--prefix=$(TT)
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
