# Man-pages Makefile

NM= man-pages
VRS= 3.23
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 34452a00ccd9a9463d7ca66aeab55d5993a70fa9

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
