# Glibc Makefile
# The Glibc package contains the main C library. This library provides
# the basic routines for allocating memory, searching directories,
# opening and closing files, reading and writing files, string handling,
# pattern matching, arithmetic, and so on.

NAME= glibc
DIR= $(NAME)-2.17
FILE= $(DIR).tar.xz
URL-$(FILE)= http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE)= 87bf675c8ee523ebda4803e8e1cec638

FILE1= tzdata2013c.tar.gz
URL-$(FILE1)= http://www.iana.org/time-zones/repository/releases/$(FILE1)
SUM-$(FILE1)= b5062217a2dea6823dd69b4dda97b249

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	if [ ! -r /usr/include/rpc/types.h ]; then \
		su -c 'mkdir -p /usr/include/rpc' && \
		su -c 'cp sunrpc/rpc/*.h /usr/include/rpc' ; \
    fi
	../$(DIR)/configure \
		--prefix=/tools \
		--host=$(LFS_TGT) \
		--build=$$(../$(DIR)/scripts/config.guess) \
		--disable-profile \
		--enable-kernel=2.6.25 \
		--with-headers=/tools/include \
		libc_cv_forced_unwind=yes \
		libc_cv_ctors_header=yes \
		libc_cv_c_cleanup=yes \
	make
	make install
	echo 'main(){}' | $(LFS_TGT)-gcc -x c -
	readelf -l a.out | grep ': /tools'
	rm a.out

stage2: $(FILE) $(FILE1)
	$(sep_dir_build)

compile-stage2:
	../$(DIR)/configure \
		--prefix=/usr \
		--disable-profile \
		--enable-kernel=2.6.25 \
		--libexecdir=/usr/lib/glibc
	make
	make -k check 2>&1 | tee glibc-check-log
	grep Error glibc-check-log
	touch /etc/ld.so.conf
	make install
	cp ../$(DIR)/sunrpc/rpc/*.h /usr/include/rpc
	cp ../$(DIR)/sunrpc/rpcsvc/*.h /usr/include/rpcsvc
	cp ../$(DIR)/nis/rpcsvc/*.h /usr/include/rpcsvc
	mkdir -p /usr/lib/locale
	localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
	localedef -i de_DE -f ISO-8859-1 de_DE
	localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
	localedef -i de_DE -f UTF-8 de_DE.UTF-8
	localedef -i en_GB -f UTF-8 en_GB.UTF-8
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
	localedef -i it_IT -f UTF-8 it_IT.UTF-8
	localedef -i ja_JP -f EUC-JP ja_JP
	localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
	localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
	localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
	localedef -i zh_CN -f GB18030 zh_CN.GB18030
	localedef -i zh_CN -f UTF-8 zh_CN.UTF-8
	cp $(MY_ROOT)/etc/nsswitch.conf /etc
	tar xf ../$(FILE1)
	mkdir -p /usr/share/zoneinfo/{posix,right}
	for tz in etcetera southamerica northamerica europe africa antarctica  \
		      asia australasia backward pacificnew solar87 solar88 solar89 \
			  systemv; do \
		zic -L /dev/null   -d /usr/share/zoneinfo       -y "sh yearistype.sh" $${tz} && \
		zic -L /dev/null   -d /usr/share/zoneinfo/posix -y "sh yearistype.sh" $${tz} && \
		zic -L leapseconds -d /usr/share/zoneinfo/right -y "sh yearistype.sh" $${tz} && \
	done
	cp zone.tab iso3166.tab /usr/share/zoneinfo
	zic -d /usr/share/zoneinfo -p America/New_York
	cp --remove-destination /usr/share/zoneinfo/$(timezone) /etc/localtime
	cp $(MY_ROOT)/etc/ld.so.conf /etc
	mkdir -p /etc/ld.so.conf.d
	mv /tools/bin/{ld,ld-old}
	mv /tools/$$(gcc -dumpmachine)/bin/{ld,ld-old}
	mv /tools/bin/{ld-new,ld}
	ln -s /tools/bin/ld /tools/$$(gcc -dumpmachine)/bin/ld
	gcc -dumpspecs | sed \
	  -e 's@/tools@@g' \
	  -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
	  -e '/^\*cpp:$$/{n;s,$$, -isystem /usr/include,}' \
	  > `dirname $$(gcc --print-libgcc-file-name)`/specs
	echo 'main(){}' | cc -x c - -v -Wl,--verbose &> dummy.log
	readelf -l a.out | grep ': /lib'
	grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
	grep -B1 '^ /usr/include' dummy.log
	grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
	grep "/lib.*/libc.so.6 " dummy.log
	grep found dummy.log
	rm a.out dummy.log

clean:
	-rm -rf $(DIR)
	-rm -rf $(NAME)-build

.PHONY: compile-stage1 compile-stage2 clean
