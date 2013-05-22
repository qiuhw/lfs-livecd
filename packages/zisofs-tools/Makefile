# zisofs-tools Makefile

NM= zisofs-tools
VRS= 1.0.8
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 9ac33b37dcbe00c6adf51d171156cae87e0b7f22

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=$(TT) CFLAGS="-I$(TT)/include" LDFLAGS="-L$(TT)/lib"
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
