# Module-Init-Tools Makefile

NAME= module-init-tools
VER= 3.11.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= https://www.kernel.org/pub/linux/utils/kernel/module-init-tools/module-init-tools-3.11.1.tar.bz2
SUM-$(FILE)= 1be5f6be71fb9ea7790c9736114bbbf14e43c32e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/ --enable-zlib-dynamic --mandir=/usr/share/man
	make
	make INSTALL=install install
	install -m644 $(MY_ROOT)/etc/modprobe.conf /etc/modprobe.conf

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
