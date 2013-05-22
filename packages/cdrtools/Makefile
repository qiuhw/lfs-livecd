# CDRTools Makefile

NM= cdrtools
VRS= 3.00
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 6464844d6b936d4f43ee98a04d637cd91131de4e

include $(MY_ROOT)/scripts/functions

stage1: Makefile $(FILE)
	$(std_build)

compile-stage1:
	make INS_BASE=$(TT) DEFINSUSR=root DEFINSGRP=root
	make INS_BASE=$(TT) DEFINSUSR=root DEFINSGRP=root install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage1
