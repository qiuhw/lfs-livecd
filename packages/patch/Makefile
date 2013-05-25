# Patch Makefile

NAME= patch
VRS= 2.6.1
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/patch/patch-2.6.1.tar.bz2
SHA-$(FILE)= 105f313d14b5458e0aa229c518bda9ebdf921a1b

PATCH= $(DIR)-test_fix-1.patch
URL-$(PATCH)= http://www.linuxfromscratch.org/patches/lfs/6.6/patch-2.6.1-test_fix-1.patch
SHA-$(PATCH)= c6e7b69a51c282c910dcc30365bd7a428f244a45

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
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
