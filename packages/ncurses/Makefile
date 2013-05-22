# Ncurses Makefile

NM= ncurses
VRS= 5.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 8233ee56ed84ae05421e4e6d6db6c1fe72ee6797

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=$(TT) \
		--with-shared \
		--without-debug \
		--without-ada \
		--enable-overwrite
	make
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--with-shared \
		--without-debug \
		--enable-widec
	make
	make install
	chmod -v 644 /usr/lib/libncurses++w.a
	mv /usr/lib/libncursesw.so.5* /lib
	ln -sfv ../../lib/libncursesw.so.5 /usr/lib/libncursesw.so
	for lib in curses ncurses form panel menu ; do \
	  rm -vf /usr/lib/lib$${lib}.so ; \
	  echo "INPUT(-l$${lib}w)" >/usr/lib/lib$${lib}.so ; \
	  ln -sfv lib$${lib}w.a /usr/lib/lib$${lib}.a ; \
	done
	ln -sfv libncurses++w.a /usr/lib/libncurses++.a
	rm -vf /usr/lib/libcursesw.so
	echo "INPUT(-lncursesw)" >/usr/lib/libcursesw.so
	ln -svf libncurses.so /usr/lib/libcurses.so
	ln -sfv libncursesw.a /usr/lib/libcursesw.a
	ln -sfv libncurses.a /usr/lib/libcurses.a

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
