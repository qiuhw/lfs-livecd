# vte Makefile

NM= vte
VRS= 0.22.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= c9dd126991cf6d50ac3c678c0e117a5b2fefc180

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i -e 's%\\177:%&kh=\\EOH:@7=\\EOF:%g' termcaps/xterm
	./configure --prefix=/usr --libexecdir=/usr/sbin
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
