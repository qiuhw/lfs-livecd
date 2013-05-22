# ncftp Makefile

NM= ncftp
VRS= 3.2.4
DIR= $(NM)-$(VRS)

FILE= $(DIR)-src.tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 7e149123c45e1628882c0866c3ebea3ba37f9929

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc
	make -C libncftp shared
	make -C libncftp soinstall
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
