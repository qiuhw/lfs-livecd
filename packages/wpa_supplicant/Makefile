# wpa_supplicant Makefile

NM= wpa_supplicant
VRS= 0.6.10
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://wl500g.googlecode.com/svn-history/r3173/branches/rt-n/wpa_supplicant/wpa_supplicant-0.6.10.tar.gz
SHA-$(FILE)= d2c93758607de250a8dda7adc8f8b304d0a074ce

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cd $(NM) ; cp defconfig .config
	cd $(NM) ; make
	cd $(NM) ; install -m755 $(NM) wpa_passphrase wpa_cli /usr/bin
	mkdir -p /etc/$(NM)
	cd $(NM) ; cp examples/*.conf /etc/$(NM)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
