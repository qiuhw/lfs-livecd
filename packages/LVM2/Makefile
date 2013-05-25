# lvm2 Makefile

NAME= LVM2
VER= 2.02.64
DIR= $(NAME).$(VER)

FILE= $(DIR).tgz
URL-$(FILE)= http://sourceware.mirrors.tds.net/pub/sourceware.org/lvm2/old/LVM2.2.02.64.tgz
SHA-$(FILE)= 033a317f1ca8baa3b30e10cf4095f0491a10db7f

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--enable-dmeventd \
		--enable-cmdlib
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
