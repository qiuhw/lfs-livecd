NAME = perl
VER  = 5.18.0
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.bz2
URL-$(FILE) = http://www.cpan.org/src/5.0/$(FILE)
SUM-$(FILE) = a832e928adfd36d162d2a5d3b631265c

PATCH = $(DIR)-libc-1.patch
URL-$(PATCH) = http://www.linuxfromscratch.org/patches/lfs/development/$(PATCH)
SUM-$(PATCH) = daf5c64fd7311e924966842680535f8f

include $(MY_ROOT)/scripts/functions

stage1: $(FILE) $(PATCH1)
	$(std_build)

compile-stage1:
	patch -Np1 -i ../$(PATCH)
	sh Configure -des -Dprefix=/tools
	make
	cp perl cpan/podlators/pod2man /tools/bin
	mkdir -p /tools/lib/perl5/$(VER)
	cp -R lib/* /tools/lib/perl5/$(VER)

stage2: $(FILE)
	$(std_build)

compile-stage2:
	# LFS has:
	# echo "127.0.0.1 localhost $(hostname)" > /etc/hosts
	# this is already taken care of by the createfiles target
	sed -i -e "s|BUILD_ZLIB\s*= True|BUILD_ZLIB = False|" \
		   -e "s|INCLUDE\s*= ./zlib-src|INCLUDE    = /usr/include|" \
		   -e "s|LIB\s*= ./zlib-src|LIB        = /usr/lib|" \
		cpan/Compress-Raw-Zlib/config.in
	sh Configure -des -Dprefix=/usr \
		              -Dvendorprefix=/usr \
		              -Dman1dir=/usr/share/man/man1 \
		              -Dman3dir=/usr/share/man/man3 \
		              -Dpager="/usr/bin/less -isR" \
					  -Duseshrplib
	make
	make -k test
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
