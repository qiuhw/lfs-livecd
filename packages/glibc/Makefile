# Glibc Makefile
# The Glibc package contains the main C library. This library provides
# the basic routines for allocating memory, searching directories,
# opening and closing files, reading and writing files, string handling,
# pattern matching, arithmetic, and so on.

NM= glibc
DIR= $(NM)-2.11.1
FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/glibc/$(FILE)
SHA-$(FILE)= 29f492ae56fd4ef79f32b45c29c0edb6aa8a35a7

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	../$(DIR)/configure \
		--prefix=/tools \
		--host=$(LFS_TGT) \
		--build=$$(../$(DIR)/scripts/config.guess) \
		--disable-profile \
		--enable-add-ons \
		--enable-kernel=2.6.18 \
		--with-headers=/tools/include \
		libc_cv_forced_unwind=yes \
		libc_cv_c_cleanup=yes \
	make
	make install
	$(LFS_TGT)-gcc -dumpspecs | sed \
	 -e 's@/lib\(64\)\?/ld@/tools&@g' \
	 -e "/^\*cpp:$$/{n;s,$$, -isystem /tools/include,}" \
	 > `dirname $$($(LFS_TGT)-gcc -print-libgcc-file-name)`/specs
	echo 'main(){}' | $(LFS_TGT)-gcc -B/tools/lib/ -x c -
	readelf -l a.out | grep ': /tools'
	rm a.out

stage2: $(FILE)
	$(sep_dir_build)

compile-stage2:
	sed -i "s|libs -o|libs -L/usr/lib -Wl,-dynamic-linker=`readelf -l /bin/sh | sed -n 's@.*interpret.*/tools\(.*\)]$$@\1@p'` -o|" \
        ../$(DIR)/scripts/test-installation.pl
	sed -i 's|@BASH@|/bin/bash|' ../$(DIR)/elf/ldd.bash.in
	../$(DIR)/configure \
		--prefix=/usr \
		--disable-profile \
		--enable-add-ons \
		--enable-kernel=2.6.18 \
		--libexecdir=/usr/lib/glibc
	make
	cp ../$(DIR)/iconvdata/gconv-modules iconvdata
	make -k check 2>&1 | tee glibc-check-log
	grep Error glibc-check-log
	touch /etc/ld.so.conf
	make install
	mkdir -p /usr/lib/locale
	localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
	localedef -i de_DE -f ISO-8859-1 de_DE
	localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
	localedef -i de_DE -f UTF-8 de_DE.UTF-8
	localedef -i en_HK -f ISO-8859-1 en_HK
	localedef -i en_PH -f ISO-8859-1 en_PH
	localedef -i en_US -f ISO-8859-1 en_US
	localedef -i en_US -f UTF-8 en_US.UTF-8
	localedef -i es_MX -f ISO-8859-1 es_MX
	localedef -i fa_IR -f UTF-8 fa_IR
	localedef -i fr_FR -f ISO-8859-1 fr_FR
	localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
	localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
	localedef -i it_IT -f ISO-8859-1 it_IT
	localedef -i ja_JP -f EUC-JP ja_JP
	localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
	localedef -i zh_CN -f GB18030 zh_CN.GB18030
	localedef -i zh_CN -f UTF-8 zh_CN.UTF-8
	cp $(MY_ROOT)/etc/nsswitch.conf /etc
	cp --remove-destination /usr/share/zoneinfo/$(timezone) /etc/localtime
	cp $(MY_ROOT)/etc/ld.so.conf /etc
	mv /tools/bin/{ld,ld-old}
	mv /tools/$$(gcc -dumpmachine)/bin/{ld,ld-old}
	mv /tools/bin/{ld-new,ld}
	ln -s /tools/bin/ld /tools/$$(gcc -dumpmachine)/bin/ld
	gcc -dumpspecs | sed \
	  -e 's@/tools@@g' \
	  -e '/^\*cpp:$$/{n;s,$$, -isystem /usr/include,}' \
	  -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
	  > `dirname $$(gcc --print-libgcc-file-name)`/specs
	echo 'main(){}' | cc -x c - -v -Wl,--verbose &> dummy.log
	grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
	grep -B1 '^ /usr/include' dummy.log
	grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
	grep "/lib.*/libc.so.6 " dummy.log
	grep found dummy.log
	readelf -l a.out | grep ': /lib'
	rm a.out dummy.log

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-stage1 compile-stage2 clean
