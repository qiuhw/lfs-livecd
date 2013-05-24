# Bash Makefile
# The Bash package contains the Bourne-Again SHell.

NM= bash
DIR= $(NM)-4.1
FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/$(NM)/$(FILE)
SHA-$(FILE)= 3bd1ec9c66f3689f6b3495bdaaf9077b2e5dc150

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=/tools --without-bash-malloc
	make
	make install
	ln -s bash /tools/bin/sh

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--bindir=/bin \
		--htmldir=/usr/share/doc/$(DIR) \
		--without-bash-malloc \
		--with-installed-readline
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
