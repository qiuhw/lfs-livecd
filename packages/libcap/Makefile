# libcap Makefile

NM= libcap
VRS= 2.19
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= c6e3c8b3962bab2399824dd3091d4921d2a2b89e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
