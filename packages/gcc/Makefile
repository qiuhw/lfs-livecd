# Gcc Makefile
# The GCC package contains the GNU compiler collection, which includes the C and C++ compilers.

NM= gcc
DIR= $(NM)-4.4.3
FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/gcc/$(DIR)/$(FILE)
SHA-$(FILE)= 619766282734728539ce58a5c383cb371f1999c7

NM1= mpfr
DIR1= $(NM1)-2.4.2
FILE1= $(DIR1).tar.bz2
URL-$(FILE1)= http://www.mpfr.org/$(DIR1)/$(FILE1)
SHA-$(FILE1)= 7ca93006e38ae6e53a995af836173cf10ee7c18c

NM2= gmp
DIR2= $(NM2)-5.0.0
FILE2= $(DIR2).tar.bz2
URL-$(FILE2)= http://ftp.gnu.org/gnu/gmp/$(FILE2)
SHA-$(FILE2)= 11a49c6fec0a3cfae2df9966d321d740af9f603f

PATCH1= $(DIR)-startfiles_fix-1.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/lfs/6.6/$(PATCH1)
SHA-$(PATCH1)= 779bc28d8e3b330d189af660a236f7a2f51698fe

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE) $(FILE1) $(FILE2)
	$(sep_dir_build)

compile-prebuild:
	cd ../$(DIR) ; tar xf ../$(FILE1); mv $(DIR1) $(NM1)
	cd ../$(DIR) ; tar xf ../$(FILE2); mv $(DIR2) $(NM2)
	../$(DIR)/configure \
		--target=$(LFS_TGT) --prefix=/tools \
		--disable-nls --disable-shared --disable-multilib \
		--disable-decimal-float --disable-threads \
		--disable-libmudflap --disable-libssp \
		--disable-libgomp --enable-languages=c
	make
	make install
	ln -s libgcc.a `$(LFS_TGT)-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`

stage1: $(FILE) $(FILE1) $(FILE2) $(PATCH1)
	$(sep_dir_build)

compile-stage1:
	cd ../$(DIR) ; patch -Np1 -i ../$(PATCH1)
	sed -i 's@\./fixinc\.sh@-c true@' ../$(DIR)/gcc/Makefile.in
	sed -i 's/^T_CFLAGS =$$/& -fomit-frame-pointer/' ../$(DIR)/gcc/Makefile.in
	for file in $$(find ../$(DIR)/gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h) ; \
	do cp -u $$file{,.orig} && \
	sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
	    -e 's@/usr@/tools@g' $$file.orig > $$file && \
	echo '' >> $$file && \
	echo '#undef STANDARD_INCLUDE_DIR' >> $$file && \
	echo '#define STANDARD_INCLUDE_DIR 0' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_1 ""' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file && \
	touch $$file.orig ; \
	done
	case $(shell uname -m) in \
		x86_64) \
		    for file in $$(find ../$(DIR)/gcc/config -name t-linux64) ; do \
		      sed -i '/MULTILIB_OSDIRNAMES/d' $$file; \
			done; \
	    ;; \
	esac
	cd ../$(DIR) ; tar xf ../$(FILE1); mv $(DIR1) $(NM1)
	cd ../$(DIR) ; tar xf ../$(FILE2); mv $(DIR2) $(NM2)
	CC="$(LFS_TGT)-gcc -B/tools/lib/" \
		AR=$(LFS_TGT)-ar RANLIB=$(LFS_TGT)-ranlib \
		../$(DIR)/configure --prefix=/tools \
		--with-local-prefix=/tools --enable-clocale=gnu \
		--enable-shared --enable-threads=posix \
		--enable-__cxa_atexit --enable-languages=c,c++ \
		--disable-libstdcxx-pch --disable-multilib \
		--disable-bootstrap
	make
	make install
	ln -s gcc /tools/bin/cc
	echo 'main(){}' > dummy.c
	cc dummy.c
	readelf -l a.out | grep ': /tools'
	rm dummy.c a.out

stage2: $(FILE)
	$(sep_dir_build)

compile-stage2:
	sed -i 's/install_to_$$(INSTALL_DEST) //' ../$(DIR)/libiberty/Makefile.in
	case `uname -m` in \
		i?86) sed -i 's/^T_CFLAGS =$$/& -fomit-frame-pointer/' ../$(DIR)/gcc/Makefile.in ; \
		;; \
    esac
	sed -i 's@\./fixinc\.sh@-c true@' ../$(DIR)/gcc/Makefile.in
	sed -i 's/getline/get_line/' ../$(DIR)/libiberty/testsuite/test-demangle.c
	../$(DIR)/configure \
		--prefix=/usr \
		--libexecdir=/usr/lib \
		--enable-shared \
		--enable-threads=posix \
		--enable-__cxa_atexit \
		--enable-clocale=gnu \
		--enable-languages=c,c++ \
		--disable-multilib \
		--disable-bootstrap \
	make
	make -k check
	../$(DIR)/contrib/test_summary |grep -A7 Summ
	make install
	ln -s ../usr/bin/cpp /lib
	ln -s gcc /usr/bin/cc
	echo 'main(){}' > dummy.c
	cc dummy.c -v -Wl,--verbose &> dummy.log
	readelf -l a.out | grep ': /lib'
	grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
	grep -B4 '^ /usr/include' dummy.log
	grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
	grep "/lib.*/libc.so.6 " dummy.log
	grep found dummy.log
	rm dummy.c a.out dummy.log
	
clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-prebuild compile-stage1 compile-stage2 clean
