# E2fsprogs Makefile

NAME= e2fsprogs
VER= 1.41.10
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.41.10.tar.gz
SUM-$(FILE)= 18fa09e34009c5fcbce40461ac435ddcce0fee39

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	mkdir -v build
	cd build ; ../configure \
		--prefix=/usr \
		--with-root-prefix="" \
		--enable-elf-shlibs \
		--libdir=/usr/lib \
		--disable-libblkid \
		--disable-libuuid \
		--disable-uuidd \
		--disable-fsck
	cd build ; make
	cd build ; make install
	cd build ; make install-libs
	chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage1 compile-stage2
