# Gettext Makefile

NM= gettext
VRS= 0.17
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= c51803d9f745f6ace36bd09c0486d5735ce399cf

PATCH= $(DIR)-upstream_fixes-2.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
SHA-$(PATCH)= 6bc51e592c8f6400f0c4501c9d0364ef4151b45b

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	cd $(NM)-tools ; ./configure --prefix=$(TT) --disable-shared
	cd $(NM)-tools ; make -C gnulib-lib
	cd $(NM)-tools ; make -C src msgfmt
	cd $(NM)-tools ; cp -v src/msgfmt $(TT)/bin

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
