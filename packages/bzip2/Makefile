# Bzip2 Makefile

NM= bzip2
VRS= 1.0.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 8b02713ea0c8eb501cc8bdac4432d7f29700f767

PATCH= $(DIR)-install_docs-1.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
SHA-$(PATCH)= 86fa168b260bb12651ebfa6d47939e926e067036

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	make
	make PREFIX=$(TT) install

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	sed -i 's@\(ln -s -f \)$$(PREFIX)/bin/@\1@' Makefile
	make -f Makefile-libbz2_so
	make clean
	make
	make PREFIX=/usr install
	cp -v bzip2-shared /bin/bzip2
	cp -av libbz2.so* /lib
	ln -svf ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
	rm -v /usr/bin/{bunzip2,bzcat,bzip2}
	ln -svf bzip2 /bin/bunzip2
	ln -svf bzip2 /bin/bzcat

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
