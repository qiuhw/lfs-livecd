# Grep Makefile

NM= grep
VRS= 2.5.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 9bbd4f02b18bb264e0fcb17293b6f0445c8694d2

PATCH= $(DIR)-debian_fixes-1.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
SHA-$(PATCH)= 77b5967bc0aa25fa827f892cd0f4625e18d0361f

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT) \
		--disable-perl-regexp \
		--without-included-regex
	make
	make install

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure \
		--prefix=/usr \
		--bindir=/bin \
		--without-included-regex
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
