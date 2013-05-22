# URI Makefile

NM= URI
VRS= 1.54
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/perl-modules/$(FILE)
SHA-$(FILE)= e0ef831aed3b3dd44b3027075b610a81c135ddae

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	perl Makefile.PL
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
