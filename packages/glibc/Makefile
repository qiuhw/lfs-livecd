# Glibc Makefile

NM= glibc
VRS= 2.11.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 29f492ae56fd4ef79f32b45c29c0edb6aa8a35a7

ifeq ($(MY_ARCH),sparc64)
SPARCTLS=libc_cv_sparc64_tls=yes
endif

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
ifeq ($(ARCH64),true)
	echo "slibdir=$(TT)/lib64" > configparms
	echo "libdir=$(TT)/lib64" >> configparms
else
ifeq ($(MY_ARCH),i686)
	echo "CFLAGS += -march=i486 -mtune=i686 $(CFLAGS)" > configparms
endif
endif
		../$(DIR)/configure \
		--prefix=$(TT) \
		--host=$(BUILD_ARCH) \
		--build=$$(../$(DIR)/scripts/config.guess) \
		--disable-profile \
		--enable-add-ons \
		--enable-kernel=2.6.18 \
		--with-headers=$(TT)/include \
		libc_cv_forced_unwind=yes \
		libc_cv_c_cleanup=yes \
		libc_cv_initfini_array=yes $(SPARCTLS)
	make
	make install
	$(BUILD_ARCH)-gcc -dumpspecs | sed \
	 -e 's@/lib\(64\)\?/ld@/tools&@g' \
	 -e "/^\*cpp:$$/{n;s,$$, -isystem $(TT)/include,}" \
	 > `dirname $$($(BUILD_ARCH)-gcc -print-libgcc-file-name)`/specs
	echo 'main(){}' | $(BUILD_ARCH)-gcc -B$(TT)/lib/ -x c - -v -Wl,--verbose
	readelf -l a.out | grep $(TT)
	rm -vf a.out

stage2: $(FILE)
	$(sep_dir_build)

compile-stage2:
	cd ../$(DIR) ; sed -i "s|libs -o|libs -L/usr/lib -Wl,-dynamic-linker=`readelf -l /bin/sh | sed -n 's@.*interpret.*$(TT)\(.*\)]$$@\1@p'` -o|" \
        scripts/test-installation.pl
	cd ../$(DIR) ; sed -i 's|@BASH@|/bin/bash|' elf/ldd.bash.in
ifeq ($(MY_ARCH),i686)
	echo "CFLAGS += -march=i486 -mtune=i686" > configparms
endif
	CC="gcc $(MY_FLAGS)" \
		../$(DIR)/configure \
		--prefix=/usr \
		--disable-profile \
		--enable-add-ons \
		--enable-kernel=2.6.18 \
		--libexecdir=/usr/lib/glibc
	make
	touch /etc/ld.so.conf
	make install
	mkdir -pv /usr/lib/locale
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
	cp $(MY_ROOT)/etc/nsswitch.conf /etc
	cp --remove-destination /usr/share/zoneinfo/$(timezone) /etc/localtime
	cp $(MY_ROOT)/etc/ld.so.conf /etc
	mv -v $(TT)/bin/{ld,ld-old}
	mv -v $(TT)/$$(gcc -dumpmachine)/bin/{ld,ld-old}
	mv -v $(TT)/bin/{ld-new,ld}
	ln -sv $(TT)/bin/ld $(TT)/$$(gcc -dumpmachine)/bin/ld
	gcc -dumpspecs | sed \
	  -e 's@$(TT)@@g' \
	  -e '/^\*cpp:$$/{n;s,$$, -isystem /usr/include,}' \
	  -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
	  > `dirname $$(gcc --print-libgcc-file-name)`/specs
	echo 'main(){}' | cc -x c - -v -lrt -Wl,--verbose
	readelf -l a.out | grep ': /lib'
	rm -fv a.out

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-stage1 clean compile-stage2
