# alsa-utils Makefile

NM= alsa-utils
VRS= 1.0.21
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= b0b6ece5198143647db90171ca573654f337f9ae

PATCH= $(DIR)-no_xmlto-1.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
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
