# Ncurses Makefile
# The Ncurses package contains libraries for terminal-independent handling of character screens.

NM= ncurses
DIR= $(NM)-5.7
FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.gnu.org/gnu/$(NM)/$(FILE)
SHA-$(FILE)= 8233ee56ed84ae05421e4e6d6db6c1fe72ee6797

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=/tools \
		--with-shared \
		--without-debug \
		--without-ada \
		--enable-overwrite
	make
	make install

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--with-shared \
		--without-debug \
		--enable-widec
	make
	make install
	mv /usr/lib/libncursesw.so.5* /lib
	ln -sf ../../lib/libncursesw.so.5 /usr/lib/libncursesw.so
	for lib in ncurses form panel menu ; do \
	  rm -f /usr/lib/lib$${lib}.so ; \
	  echo "INPUT(-l$${lib}w)" >/usr/lib/lib$${lib}.so ; \
	  ln -sf lib$${lib}w.a /usr/lib/lib$${lib}.a ; \
	done
	ln -sf libncurses++w.a /usr/lib/libncurses++.a
	rm -f /usr/lib/libcursesw.so
	echo "INPUT(-lncursesw)" >/usr/lib/libcursesw.so
	ln -sf libncurses.so /usr/lib/libcurses.so
	ln -sf libncursesw.a /usr/lib/libcursesw.a
	ln -sf libncurses.a /usr/lib/libcurses.a

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
