# xcursor-themes Makefile

NM= xcursor-themes
VRS= 1.0.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 12b865c17c65e70a6bc20300dfa660fe8faaa0a4

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
