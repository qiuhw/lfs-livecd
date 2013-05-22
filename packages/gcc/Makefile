# Gcc Makefile

NM= gcc
VRS= 4.4.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 619766282734728539ce58a5c383cb371f1999c7

FILE1= mpfr-2.4.2.tar.bz2
URL-$(FILE1)= $(HTTP)/mpfr/$(FILE1)
SHA-$(FILE1)= 7ca93006e38ae6e53a995af836173cf10ee7c18c

FILE2= gmp-5.0.0.tar.bz2
URL-$(FILE2)= $(HTTP)/gmp/$(FILE2)
SHA-$(FILE2)= 11a49c6fec0a3cfae2df9966d321d740af9f603f

PATCH1= $(NM)-$(VRS)-startfiles_fix-1.patch
URL-$(PATCH1)= $(HTTP)/$(NM)/$(PATCH1)
SHA-$(PATCH1)= 779bc28d8e3b330d189af660a236f7a2f51698fe

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE) $(FILE1) $(FILE2)
	$(sep_dir_build)

compile-prebuild:
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE1)) mpfr
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE2)) gmp
	../$(DIR)/configure \
		--prefix=$(TT) \
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
	sed -e 's@/lib\(64\)\?\(32\)\?/ld@$(TT)&@g' \
	    -e 's@/usr@$(TT)@g' $$file.orig > $$file && \
	echo '' >> $$file && \
	echo '#undef STANDARD_INCLUDE_DIR' >> $$file && \
	echo '#define STANDARD_INCLUDE_DIR 0' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_1 ""' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file && \
	touch $$file.orig ; \
	done
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE1)) mpfr
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE2)) gmp
	CC="$(BUILD_ARCH)-gcc -B$(TT)/lib/" \
		AR=$(BUILD_ARCH)-ar \
		RANLIB=$(BUILD_ARCH)-ranlib \
		../$(DIR)/configure \
		--prefix=$(TT) \
		--with-local-prefix=$(TT) \
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
	ln -vs gcc $(TT)/bin/cc
	echo 'main(){}' | cc -x c - -v -lrt -Wl,--verbose
	readelf -l a.out | grep $(TT)
	rm -vf a.out

chroot:
	chroot "$(MP)" $(chenv-pre-bash) \
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
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE1)) mpfr
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE2)) gmp
	cd ../$(DIR) ; sed -i 's/install_to_$$(INSTALL_DEST) //' \
	 libiberty/Makefile.in
	cd ../$(DIR) ; sed -i 's,\./fixinc\.sh,-c true,' gcc/Makefile.in
	cd ../$(DIR) ; sed -i 's/getline/get_line/' libiberty/testsuite/test-demangle.c
	cd ../$(DIR) ; sed -i 's/^T_CFLAGS =$$/& -fomit-frame-pointer/' \
	 gcc/Makefile.in
	PATH=$$PATH:$(WD)/bin \
		../$(DIR)/configure \
		--prefix=$(TT) \
		--target=x86_64-unknown-linux-gnu \
		--disable-shared \
		--disable-threads \
		--enable-languages=c \
		--enable-static
	PATH=$$PATH:$(TT)/bin make all-gcc
	PATH=$$PATH:$(TT)/bin make install-gcc

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-stage1 clean chroot compile-prebuild compile-stage2 compile-stage3
