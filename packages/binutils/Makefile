# Binutils Makefile
#
# The Binutils package contains a liner, an assembler, and other tools for handling object files.

NM= binutils
DIR= $(NM)-2.23.2

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/$(NM)/$(FILE)
SUM-$(FILE)= 4f8fa651e35ef262edc01d60fb45702e

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE)
	$(sep_dir_build)

compile-prebuild:
	sed -i -e 's/@colophon/@@colophon/' \
		   -e 's/doc@cygnus.com/doc@@cygnus.com/' ../$(DIR)/bfd/doc/bfd.texinfo
	../$(DIR)/configure \
		--prefix=/tools \
		--with-sysroot=$(LFS) \
		--with-lib-path=/tools/lib \
		--target=$(LFS_TGT) \
		--disable-nls \
		--disable-werror
	make
	install -d /tools/lib && ln -s lib /tools/lib64
	make install

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	sed -i -e 's/@colophon/@@colophon/' \
		   -e 's/doc@cygnus.com/doc@@cygnus.com/' ../$(DIR)/bfd/doc/bfd.texinfo
	CC=$(LFS_TGT)-gcc \
	AR=$(LFS_TGT)-ar \
	RANLIB=$(LFS_TGT)-ranlib \
	../$(DIR)/configure \
		--prefix=/tools \
		--disable-nls \
		--with-lib-path=/tools/lib \
		--with-sysroot
	make
	make install
	make -C ld clean
	make -C ld LIB_PATH=/usr/lib:/lib
	cp ld/ld-new /tools/bin

stage2: $(FILE)
	$(sep_dir_build)

compile-stage2:
	rm -f ../$(DIR)/etc/standards.info
	sed -i.bak '/^INFO/s/standards.info //' ../$(DIR)/etc/Makefile.in
	sed -i -e 's/@colophon/@@colophon/' \
		   -e 's/doc@cygnus.com/doc@@cygnus.com/' ../$(DIR)/bfd/doc/bfd.texinfo
	../$(DIR)/configure \
		--prefix=/usr \
		--enable-shared
	make tooldir=/usr
	make check
	make tooldir=/usr install
	cp ../$(DIR)/include/libiberty.h /usr/include

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-prebuild compile-stage1 compile-stage2 clean
