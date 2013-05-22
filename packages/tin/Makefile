# tin Makefile

NM= tin
VRS= 1.8.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 3822e7281d22433862075270b06bfa6b82226b0e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --enable-included-msgs \
	 --with-screen=ncursesw --with-mailer=/usr/bin/msmtp \
	 --enable-nntp-only --disable-pgp-gpg --disable-printing
	make build
	make install
	mkdir -p /etc/tin
	cp $(MY_ROOT)/etc/tin/tinrc /etc/tin
	echo 'gmane.linux.lfs.support:' >/root/.newsrc
	echo 'gmane.linux.lfs.beyond.support:' >>/root/.newsrc


clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
