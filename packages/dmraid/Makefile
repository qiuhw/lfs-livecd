# dmraid Makefile

NM= dmraid
VRS= 1.0.0.rc16
DIR= $(NM)

FILE= $(NM)-$(VRS).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 99e76332bb03c5a79406e3c8cb12b6746288635d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cd $(VRS) ; ./configure --prefix=/usr
	# This package doesn't like parallel build
	cd $(VRS) ; make
	cd $(VRS) ; make install

clean:
	-rm -rf $(NM)

.PHONY: clean compile-stage2
