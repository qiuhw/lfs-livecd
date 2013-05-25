# mdadm Makefile

NAME= mdadm
VER= 3.1.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= https://www.kernel.org/pub/linux/utils/raid/mdadm/mdadm-3.1.2.tar.bz2
SHA-$(FILE)= 0599bd60a6cf8194bc2b5306ec939e05f825e4ce

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make DESTDIR=/usr MANDIR=/share/man
	make DESTDIR=/usr MANDIR=/share/man install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
