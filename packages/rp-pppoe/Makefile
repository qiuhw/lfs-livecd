# RP-pppoe Makefile

NM= rp-pppoe
VRS= 3.10
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 183372b84c1bb8e22d1bd8be05a280d948ae41f9

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i s@/usr/bin/logger@/bin/logger@ \
	 scripts/pppoe-{connect,setup,stop}.in
	cd src ; ./configure
	cd src ; make
	cd src ; make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
