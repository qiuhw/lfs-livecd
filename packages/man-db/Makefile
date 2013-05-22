# man-db Makefile

NM= man-db
VRS= 2.5.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= e8799313afb31976f9c7a4e34bc4498293a6fef8

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib \
	 	--sysconfdir=/etc \
	 	--disable-setuid \
	 	--with-browser=/usr/bin/lynx \
	 	--with-vgrind=/usr/bin/vgrind \
	 	--with-grap=/usr/bin/grap
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
