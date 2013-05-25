# alsa-utils Makefile

NAME= alsa-utils
VRS= 1.0.21
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://alsa.cybermirror.org/utils/alsa-utils-1.0.21.tar.bz2
SHA-$(FILE)= b0b6ece5198143647db90171ca573654f337f9ae

PATCH= $(DIR)-no_xmlto-1.patch
URL-$(PATCH)= http://ftp.slackware.com/pub/blfs/conglomeration/alsa-utils/alsa-utils-1.0.21-no_xmlto-1.patch
SHA-$(PATCH)= 024f43daddcdc74774a588c4dbf5a729ca51778c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure
	make
	make install
	install -m755 ../set-alsa-volume /lib/udev
	echo 'KERNEL=="controlC[0-9]*", ACTION=="add", RUN+="set-alsa-volume %n"' >/etc/udev/rules.d/40-alsa.rules

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
