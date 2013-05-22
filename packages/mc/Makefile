# MC Makefile

NM= mc
VRS= 4.7.1
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 61fd896780798d17bd1e41ee3910e36a4b0d306a

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	CPPFLAGS="-DUTF8" ./configure --prefix=/usr --enable-charset
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
