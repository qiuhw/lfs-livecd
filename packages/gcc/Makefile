# Gcc Makefile

NM= gcc
VRS= 4.4.3
DIR= $(NM)-$(VRS)
FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/gcc/gcc-4.4.3/gcc-4.4.3.tar.bz2
SHA-$(FILE)= 619766282734728539ce58a5c383cb371f1999c7

NM1= mpfr
VRS1= 2.4.2
DIR1= $(NM1)-$(VRS1)
FILE1= $(DIR1).tar.bz2
URL-$(FILE1)= http://www.mpfr.org/mpfr-2.4.2/mpfr-2.4.2.tar.bz2
SHA-$(FILE1)= 7ca93006e38ae6e53a995af836173cf10ee7c18c

NM2= gmp
VRS2= 5.0.0
DIR2= $(NM2)-$(VRS2)
FILE2= $(DIR2).tar.bz2
URL-$(FILE2)= http://ftp.gnu.org/gnu/gmp/gmp-5.0.0.tar.bz2
SHA-$(FILE2)= 11a49c6fec0a3cfae2df9966d321d740af9f603f

PATCH1= $(NM)-$(VRS)-startfiles_fix-1.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/lfs/6.6/gcc-4.4.3-startfiles_fix-1.patch
SHA-$(PATCH1)= 779bc28d8e3b330d189af660a236f7a2f51698fe

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE) $(FILE1) $(FILE2)
	$(sep_dir_build)

compile-prebuild:
	cd ../$(DIR) ; tar xf ../$(FILE1); mv $(DIR1) $(NM1)
	cd ../$(DIR) ; tar xf ../$(FILE2); mv $(DIR2) $(NM2)
	../$(DIR)/configure \
		--prefix=/tools \
		--target=$(BUILD_ARCH) \
		--disable-nls \
		--disable-shared \
		--disable-decimal-float \
		--disable-threads \
		--disable-libmudflap \
		--disable-libssp \
		--disable-libgomp \
		--disable-multilib \
		--enable-languages=c
	make
	make install
	ln -sv libgcc.a `$(BUILD_ARCH)-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`

stage1: $(FILE) $(FILE1) $(FILE2) $(PATCH1)
	$(sep_dir_build)

compile-stage1:
	cd ../$(DIR) ; patch -Np1 -i ../$(PATCH1)
	cd ../$(DIR) ; sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
	cd ../$(DIR) ; sed -i 's/^T_CFLAGS =$$/& -fomit-frame-pointer/' gcc/Makefile.in
	cd ../$(DIR) ; for file in $$(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h) ; \
	do cp -uv $$file{,.orig} && \
	sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
	    -e 's@/usr@/tools@g' $$file.orig > $$file && \
	echo '' >> $$file && \
	echo '#undef STANDARD_INCLUDE_DIR' >> $$file && \
	echo '#define STANDARD_INCLUDE_DIR 0' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_1 ""' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file && \
	touch $$file.orig ; \
	done
	cd ../$(DIR) ; tar xf ../$(FILE1); mv $(DIR1) $(NM1)
	cd ../$(DIR) ; tar xf ../$(FILE2); mv $(DIR2) $(NM2)
	CC="$(BUILD_ARCH)-gcc -B/tools/lib/" \
		AR=$(BUILD_ARCH)-ar \
		RANLIB=$(BUILD_ARCH)-ranlib \
		../$(DIR)/configure \
		--prefix=/tools \
		--with-local-prefix=/tools \
		--enable-clocale=gnu \
		--enable-shared \
		--enable-threads=posix \
		--enable-__cxa_atexit \
		--enable-languages=c,c++ \
		--disable-libstdcxx-pch \
		--disable-multilib \
		--disable-bootstrap
	make
	make install
	ln -vs gcc /tools/bin/cc
	echo 'main(){}' | cc -x c - -v -lrt -Wl,--verbose
	readelf -l a.out | grep /tools
	rm -vf a.out

chroot:
	chroot "$(LFS)" $(chenv-pre-bash) \
	'cd $(MY_ROOT) && make ch-$(NM) $(chbash-pre-bash)'

stage2: $(FILE)
	$(sep_dir_build)

compile-stage2:
	cd ../$(DIR) ; sed -i 's/install_to_$$(INSTALL_DEST) //' \
	 libiberty/Makefile.in
	cd ../$(DIR) ; sed -i 's,\./fixinc\.sh,-c true,' gcc/Makefile.in
	cd ../$(DIR) ; sed -i 's/getline/get_line/' libiberty/testsuite/test-demangle.c
	cd ../$(DIR) ; sed -i 's/^T_CFLAGS =$$/& -fomit-frame-pointer/' \
	 gcc/Makefile.in
	../$(DIR)/configure \
		--prefix=/usr \
		--libexecdir=/usr/lib \
		--enable-shared \
		--enable-threads=posix \
		--enable-__cxa_atexit \
		--enable-clocale=gnu \
		--enable-languages=c,c++ \
		--disable-bootstrap \
		--disable-multilib
	make
	make install
	ln -svf ../usr/bin/cpp /lib
	ln -svf gcc /usr/bin/cc
	echo 'main(){}' | cc -x c - -v -lrt -Wl,--verbose
	readelf -l a.out | grep "/lib"
	rm -vf a.out
	
stage3: $(FILE) $(FILE1) $(FILE2)
	$(sep_dir_build)
	
compile-stage3:
	cd ../$(DIR) ; tar xf ../$(FILE1); mv $(DIR1) $(NM1)
	cd ../$(DIR) ; tar xf ../$(FILE2); mv $(DIR2) $(NM2)
	cd ../$(DIR) ; sed -i 's/install_to_$$(INSTALL_DEST) //' \
	 libiberty/Makefile.in
	cd ../$(DIR) ; sed -i 's,\./fixinc\.sh,-c true,' gcc/Makefile.in
	cd ../$(DIR) ; sed -i 's/getline/get_line/' libiberty/testsuite/test-demangle.c
	cd ../$(DIR) ; sed -i 's/^T_CFLAGS =$$/& -fomit-frame-pointer/' \
	 gcc/Makefile.in
	PATH=$$PATH:$(WD)/bin \
		../$(DIR)/configure \
		--prefix=/tools \
		--target=x86_64-unknown-linux-gnu \
		--disable-shared \
		--disable-threads \
		--enable-languages=c \
		--enable-static
	PATH=$$PATH:/tools/bin make all-gcc
	PATH=$$PATH:/tools/bin make install-gcc

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-stage1 clean chroot compile-prebuild compile-stage2 compile-stage3
