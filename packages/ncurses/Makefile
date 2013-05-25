NAME = ncurses
VER  = 5.9
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = ftp://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 8cb9c412e5f2d96bc6f459aa8c6282a1

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
	./configure --prefix=/usr \
		--mandir=/usr/share/man \
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
	  ln -sf $${lib}w.pc /usr/lib/pkgconfig/$${lib}.pc ; \
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
