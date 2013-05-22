# Binutils Makefile

NM= binutils
VRS= 2.20
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 747e7b4d94bce46587236dc5f428e5b412a590dc

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE)
	$(sep_dir_build)

compile-prebuild:
	../$(DIR)/configure \
		--prefix=$(TT) \
		--target=$(BUILD_ARCH) \
		--disable-nls \
		--disable-werror
	echo "MAKEINFO = :" >> Makefile
	make
	make install

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	CC="$(BUILD_ARCH)-gcc -B$(TT)/lib/" \
		AR=$(BUILD_ARCH)-ar \
		RANLIB=$(BUILD_ARCH)-ranlib \
		../$(DIR)/configure \
		--prefix=$(TT) \
		--disable-nls \
		--with-lib-path=$(TT)/lib
	echo "MAKEINFO = :" >> Makefile
	make
	make install
	make -C ld clean
	make -C ld LIB_PATH=/usr/lib:/lib
	cp -v ld/ld-new $(TT)/bin

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
	--prefix=$(TT) \
	--target=x86_64-unknown-linux-gnu \
	--disable-nls \
	--disable-werror
	make
	make install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-prebuild clean compile-stage1 compile-stage2 compile-stage3
