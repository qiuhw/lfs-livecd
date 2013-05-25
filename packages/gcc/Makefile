# Gcc Makefile
# The GCC package contains the GNU compiler collection, which includes the C and C++ compilers.

NM= gcc
DIR= $(NM)-4.7.2
FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/$(NM)/$(DIR)/$(FILE)
SUM-$(FILE)= cc308a0891e778cfda7a151ab8a6e762

NM1= mpfr
DIR1= $(NM1)-3.1.1
FILE1= $(DIR1).tar.xz
URL-$(FILE1)= http://www.mpfr.org/$(DIR1)/$(FILE1)
SUM-$(FILE1)= 91d51c41fcf2799e4ee7a7126fc95c17

NM2= gmp
DIR2= $(NM2)-5.1.1
FILE2= $(DIR2).xz
URL-$(FILE2)= ftp://ftp.gmplib.org/pub/$(DIR2)/$(FILE2)
SUM-$(FILE2)= 485b1296e6287fa381e6015b19767989

NM3= mpc
DIR3= $(NM3)-1.0.1
FILE3= $(DIR3).tar.gz
URL-$(FILE3)= http://www.multiprecision.org/$(NM3)/download/$(FILE3)
SUM-$(FILE3)= b32a2e1a3daa392372fbd586d1ed3679

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE) $(FILE1) $(FILE2)
	$(sep_dir_build)

compile-prebuild:
	cd ../$(DIR) ; tar xf ../$(FILE1); mv $(DIR1) $(NM1)
	cd ../$(DIR) ; tar xf ../$(FILE2); mv $(DIR2) $(NM2)
	cd ../$(DIR) ; tar xf ../$(FILE3); mv $(DIR3) $(NM3)
	for file in $$(find ../$(DIR)/gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h) ; \
	do cp -u $$file{,.orig} && \
	sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
	    -e 's@/usr@/tools@g' $$file.orig > $$file && \
	echo '' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_1' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_2' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file && \
	touch $$file.orig ; \
	done
	sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' ../$(DIR)/gcc/configure
	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ../$(DIR)/gcc/configure
	../$(DIR)/configure \
		--target=$(LFS_TGT) \
		--prefix=/tools \
		--with-sysroot=$(LFS) \
		--with-newlib \
		--without-headers \
		--with-local-prefix=/tools \
		--with-native-system-header-dir=/tools/include \
		--disable-nls \
		--disable-shared \
		--disable-multilib \
		--disable-decimal-float \
		--disable-threads \
		--disable-libmudflap \
		--disable-libssp \
		--disable-libgomp \
		--disable-libquadmath \
		--enable-languages=c \
		--with-mpfr-include=$(pwd)/../$(DIR)/mpfr/src \
		--with-mpfr-lib=$(pwd)/mpfr/src/.libs
	make
	make install
	ln -s libgcc.a `$(LFS_TGT)-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`

stage1: $(FILE) $(FILE1) $(FILE2) $(PATCH1)
	$(sep_dir_build)

compile-stage1:
	cat ../$(DIR)/gcc/limitx.h ../$(DIR)/gcc/glimits.h ../$(DIR)/gcc/limity.h > \
		`dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h
	sed -i 's/^T_CFLAGS =$$/& -fomit-frame-pointer/' ../$(DIR)/gcc/Makefile.in
	for file in $$(find ../$(DIR)/gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h) ; \
	do cp -u $$file{,.orig} && \
	sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
	    -e 's@/usr@/tools@g' $$file.orig > $$file && \
	echo '' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_1' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_2' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file && \
	touch $$file.orig ; \
	done
	cd ../$(DIR) ; tar xf ../$(FILE1); mv $(DIR1) $(NM1)
	cd ../$(DIR) ; tar xf ../$(FILE2); mv $(DIR2) $(NM2)
	cd ../$(DIR) ; tar xf ../$(FILE3); mv $(DIR3) $(NM3)
	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ../$(DIR)/gcc/configure
	CC=$(LFS_TGT)-gcc \
	AR=$(LFS_TGT)-ar \
	RANLIB=$(LFS_TGT)-ranlib \
	../$(DIR)/configure \
		--prefix=/tools \
		--with-local-prefix=/tools \
		--with-native-system-header-dir=/tools/include \
		--enable-clocale=gnu \
		--enable-shared \
		--enable-threads=posix \
		--enable-__cxa_atexit \
		--enable-languages=c,c++ \
		--disable-libstdcxx-pch \
		--disable-multilib \
		--disable-bootstrap \
		--disable-libgomp \
		--with-mpfr-include=$(pwd)/../$(DIR)/mpfr/src \
		--with-mpfr-lib=$(pwd)/mpfr/src/.libs
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
	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ../$(DIR)/gcc/configure
	sed -i -e /autogen/d -e /check.sh/d ../$(DIR)/fixincludes/Makefile.in
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
		--with-system-zlib
	make
	ulimit -s 32768
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
	mkdir -p /usr/share/gdb/auto-load/usr/lib
	mv /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
	
clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-prebuild compile-stage1 compile-stage2 clean
