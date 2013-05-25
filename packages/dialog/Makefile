# Dialog Makefile

NAME= dialog
VRS= 1.1-20100428
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tgz
URL-$(FILE)= ftp://invisible-island.net/dialog/dialog-1.1-20100428.tgz
SHA-$(FILE)= 6945b302bf5b107c12f6009c25699d265b45579c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--enable-nls \
	    --enable-widec \
	    --with-ncursesw
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
