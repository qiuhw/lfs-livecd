# Readline Makefile

NM= readline
VRS= 6.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 54840a0dc907e7fa598d7ffcdcbd17bae69ace83

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '/MV.*old/d' Makefile.in
	sed -i '/{OLDSUFF}/c:' support/shlib-install
	./configure \
		--prefix=/usr \
		--libdir=/lib
	make SHLIB_LIBS=-lncurses
	make install
	mv -v /lib/lib{readline,history}.a /usr/lib
	rm -v /lib/lib{readline,history}.so
	ln -sfv ../../lib/libreadline.so.6 /usr/lib/libreadline.so
	ln -sfv ../../lib/libhistory.so.6 /usr/lib/libhistory.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
