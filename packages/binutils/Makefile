# Binutils Makefile
#
# The Binutils package contains a liner, an assembler, and other tools for handling object files.

NM= binutils
DIR= $(NM)-2.20

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://anduin.linuxfromscratch.org/sources/LFS/lfs-packages/6.6/binutils-2.20.tar.bz2
SHA-$(FILE)= 747e7b4d94bce46587236dc5f428e5b412a590dc

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE)
	$(sep_dir_build)

compile-prebuild:
	../$(DIR)/configure \
		--target=$(LFS_TGT) --prefix=/tools \
		--disable-nls --disable-werror
	echo "MAKEINFO = :" >> Makefile
	make
	case $(uname -m) in \
		x86_64) install -d /tools/lib && ln -s lib /tools/lib64 ;; \
	esac
	make install

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	CC="$(LFS_TGT)-gcc -B/tools/lib/" \
		AR=$(LFS_TGT)-ar \
		RANLIB=$(LFS_TGT)-ranlib \
		../$(DIR)/configure \
		--prefix=/tools \
		--disable-nls \
		--with-lib-path=/tools/lib
	echo "MAKEINFO = :" >> Makefile
	make
	make install
	make -C ld clean
	make -C ld LIB_PATH=/usr/lib:/lib
	cp -v ld/ld-new /tools/bin

stage2: $(FILE)
	$(sep_dir_build)

compile-stage2:
	cd ../$(DIR) ; rm -fv etc/standards.info
	cd ../$(DIR) ; sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in
	../$(DIR)/configure \
		--prefix=/usr \
		--enable-shared
	make tooldir=/usr
	make tooldir=/usr install
	cp ../$(DIR)/include/libiberty.h /usr/include

stage3: $(FILE)
	$(sep_dir_build)
	
compile-stage3:
	../$(DIR)/configure \
	--prefix=/tools \
	--target=x86_64-unknown-linux-gnu \
	--disable-nls \
	--disable-werror
	make
	make install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-prebuild compile-stage1 compile-stage2 compile-stage3 clean
