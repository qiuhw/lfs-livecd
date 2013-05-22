# which Makefile

NM= which
VRS= 2.20
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 3bcd6d87aa5231917ba7123319eedcae90cfa0fd

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	rm -f /usr/bin/which
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
