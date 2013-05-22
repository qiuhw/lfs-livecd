# Anthy Makefile

NM= anthy
VRS= 9100h
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= bfea9e74e208c4b976b6bd7ac6784cd290c636fd

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc --disable-static
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
