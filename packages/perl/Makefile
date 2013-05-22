# Perl Makefile

NM= perl
VRS= 5.10.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 98b762b5cd4fb76dd354dfa5ba0d21bc2acacaf2

PATCH= $(DIR)-utf8-1.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
SHA-$(PATCH)= 8fd13345554b15be27cbb1ba5d0a190793ea6489

PATCH1= $(DIR)-libc-1.patch
URL-$(PATCH1)= $(HTTP)/$(NM)/$(PATCH1)
SHA-$(PATCH1)= 67c2e4e4d63f88b83cd8042dad04c07a4054037b

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE) $(PATCH1)
	$(std_build)

compile-stage1:
	patch -Np1 -i ../$(PATCH1)
	sh Configure -des -Dprefix=$(TT) \
	 -Dstatic_ext='Data/Dumper Fcntl IO POSIX'
	make perl utilities ext/Errno/pm_to_blib
	cp -v perl pod/pod2man $(TT)/bin
	mkdir -pv $(TT)/lib/perl5/$(VRS)
	cp -Rv lib/* $(TT)/lib/perl5/$(VRS)

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	# LFS has:
	# echo "127.0.0.1 localhost $(hostname)" > /etc/hosts
	# this is already taken care of by the createfiles target
	sed -i -e "s|BUILD_ZLIB\s*= True|BUILD_ZLIB = False|" \
	 -e "s|INCLUDE\s*= ./zlib-src|INCLUDE    = /usr/include|" \
	 -e "s|LIB\s*= ./zlib-src|LIB        = /usr/$(MY_LIBDIR)|" \
	 ext/Compress-Raw-Zlib/config.in
	sh Configure -des -Dprefix=/usr \
	 -Dvendorprefix=/usr           \
	 -Dman1dir=/usr/share/man/man1 \
	 -Dman3dir=/usr/share/man/man3 \
	 -Dpager="/usr/bin/less -isR"
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
