# NFS Utilities Makefile

NAME= nfs-utils
VER= 1.2.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/nfs/files/nfs-utils/1.2.2/nfs-utils-1.2.2.tar.bz2
SHA-$(FILE)= bf823cb85844de3ff3bf07601698aaa1cfdd8a28

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--disable-gss
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
