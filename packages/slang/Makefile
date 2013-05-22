# slang Makefile

NM= slang
VRS= 2.2.2
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 13bb6344f71779cad8c05e1b6b1ef2d073888d58

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make elf
	make install-elf
	chmod -v 755 /usr/lib/libslang.so.$(VRS)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
