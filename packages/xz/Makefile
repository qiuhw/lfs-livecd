# xz Utils Makefile

NM= xz
VRS= 4.999.9beta
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 67cd2598b5149da9b3c126f3483fd632e06b3d48

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
