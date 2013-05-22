# Make Makefile

NM= make
VRS= 3.81
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 41ed86d941b9c8025aee45db56c0283169dcab3d

PATCH= $(DIR)-upstream_fixes-1.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
SHA-$(PATCH)= ea1d9bd5bdcd6fa497b48300be38d587d3a6fbe3

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE)
	$(std_build)

compile-prebuild:
	./configure \
		--prefix=$(TT)
	make
	make install
	ln -vs make $(TT)/bin/gmake

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT)
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
	ln -sv make /usr/bin/gmake

clean:
	-rm -rf $(DIR)

.PHONY: compile-prebuild compile-stage1 clean compile-stage2
