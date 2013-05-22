# JasPer Makefile

NM= jasper
VRS= 1.900.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).zip
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 9c5735f773922e580bf98c7c7dfda9bbed4c5191

PATCH= $(DIR)-security_fixes-1.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
SHA-$(PATCH)= 025551612fb08b0694f71784d397eed3d1452ef6

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	@$(call echo_message, Building)
	@unzip $(FILE) >$(DIR)-$@.log 2>&1
	@make -C $(DIR) -f ../Makefile compile-$@ >>$(DIR)-$@.log 2>&1
	@make clean >>$(DIR)-$@.log 2>&1
	@touch $@

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--localstatedir=/var \
		--enable-shared
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
