# usbutils Makefile

NM= usbutils
VRS= 0.86
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 8789fe562a0c791cc1cdffd30af5908876efb6da

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's|DEST=|&/usr/share/|' update-usbids.sh.in
	./configure --prefix=/usr
	make
	make install
	install -v -m755 update-usbids.sh /usr/sbin/update-usbids

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
