# usbutils Makefile

NAME= usbutils
VER= 0.86
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gts.lug.ro/kernel/linux/utils/usb/usbutils/usbutils-0.86.tar.gz
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
