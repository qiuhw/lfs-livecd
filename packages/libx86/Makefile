# libx86 Makefile

NM= libx86
VRS= 1.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= c55d8a428ab7f2084010c255aa8c666602544af9

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../libx86-1.1-lrmi_fix-1.patch
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
