# vbetool Makefile

NM= vbetool
VRS= 1.1
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= c7ba7c0635160c47fb1b94fd7c7cbe39cb717d22

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --with-x86emu
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
