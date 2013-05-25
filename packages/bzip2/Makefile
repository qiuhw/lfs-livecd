# Bzip2 Makefile
# The Bzip2 package contains programs for compressing and decompressing files.
# Compressing text files with bzip2 yields a much better compression percentage
# than with the traditional gzip.

NAME= bzip2
DIR= $(NAME)-1.0.5

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.bzip.org/1.0.5/$(FILE)
SHA-$(FILE)= 8b02713ea0c8eb501cc8bdac4432d7f29700f767

PATCH= $(DIR)-install_docs-1.patch
URL-$(PATCH)= http://www.linuxfromscratch.org/patches/lfs/6.6/$(PATCH)
SHA-$(PATCH)= 86fa168b260bb12651ebfa6d47939e926e067036

# Targets

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
