# Zlib Makefile

NM= zlib
VRS= 1.2.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 967e280f284d02284b0cd8872a8e2e04bfdc7283

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=$(TT) --shared
	make
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --shared --libdir=/lib
	make
	make install
	rm -v /lib/libz.so
	ln -sfv ../../lib/libz.so.$(VRS) /usr/lib/libz.so
	make clean
	./configure --prefix=/usr --libdir=/usr/lib
	make
	make install
	chmod 644 /usr/lib/libz.a

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
