# diffutils Makefile

NM= diffutils
VRS= 2.8.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/diffutils/diffutils-2.8.1.tar.gz
SHA-$(FILE)= a4c467c3a6a08cde9f3d94d02067ec26436e7dc5

PATCH= $(DIR)-i18n-1.patch
URL-$(PATCH)= http://www.linuxfromscratch.org/patches/lfs/6.6/diffutils-2.8.1-i18n-1.patch
SHA-$(PATCH)= 2d88d693ab572f04990a3a28deb5e743e288b9da

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=/tools
	make
	make install

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	touch man/diff.1
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
