NAME = bzip2
VER  = 1.0.6
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://www.bzip.org/$(VER)/$(FILE)
SUM-$(FILE) = 00b516f4704d4a7cb50a1d97e6e8e15b

PATCH = $(DIR)-install_docs-1.patch
URL-$(PATCH) = http://www.linuxfromscratch.org/patches/lfs/development/$(PATCH)
SUM-$(PATCH) = 6a5ac7e89b791aae556de0f745916f7f

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	make
	make PREFIX=/tools install

stage2: $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	sed -i 's@\(ln -s -f \)$$(PREFIX)/bin/@\1@' Makefile
	sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
	make -f Makefile-libbz2_so
	make clean
	make
	make PREFIX=/usr install
	cp bzip2-shared /bin/bzip2
	cp -a libbz2.so* /lib
	ln -s ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
	rm /usr/bin/{bunzip2,bzcat,bzip2}
	ln -s bzip2 /bin/bunzip2
	ln -s bzip2 /bin/bzcat

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
