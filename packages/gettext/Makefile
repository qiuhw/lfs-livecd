NAME = gettext
VER  = 0.18.2.1
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 034c8103b14654ebd300fadac44d6f14

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	cd $(NAME)-tools ; EMACS="no" ./configure --prefix=/tools --disable-shared
	cd $(NAME)-tools ; make -C gnulib-lib
	cd $(NAME)-tools ; make -C src msgfmt
	cp $(NAME)-tools/src/msgfmt /tools/bin

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr \
		--docdir=/usr/share/doc/gettext-0.18.2.1
	make
	make check
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
