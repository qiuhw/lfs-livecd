# Screen Makefile

NM= screen
VRS= 4.0.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 7bc6e2f0959ffaae6f52d698c26c774e7dec3545

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --with-socket-dir=/var/run/screen \
	 --with-sys-screenrc=/etc/screenrc
	sed -i -e "s@/usr/local/etc/screenrc@/etc/screenrc@" {etc,doc}/*
	make
	make install
	install -m 644 etc/etcscreenrc /etc/screenrc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
