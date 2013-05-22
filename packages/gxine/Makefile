# gxine Makefile

NM= gxine
VRS= 0.5.905
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= dc01b617641d6eac4152259c592f15f31b9d9bf0

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/firefox-nspr/seamonkey-nspr/g' configure
	# most mediamarks are obsolete or not playable without binary codecs
	echo '<GXINEMM VERSION="1">' >misc/mediamarks
	echo '</GXINEMM>' >>misc/mediamarks
	LDFLAGS="$$LDFLAGS -Wl,-R,/usr/lib/seamonkey" ./configure \
	    --prefix=/usr --sysconfdir=/etc \
	    --enable-defeat-screensaver-via-xtest \
	    --enable-watchdog \
	    --disable-integration-wizard
	make
	make GXINE_PLUGINPATH=/usr/lib/seamonkey/plugins install
	sed -n -e 's/\$$/;/' \
	    -e 's/;\|$$/; gxine "%s"; test=test -n "$$DISPLAY"\n/g' \
	    -e 's/MimeType=// p' /usr/share/applications/gxine.desktop >/etc/mailcap

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
