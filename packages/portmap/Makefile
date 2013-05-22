# portmap Makefile

NM= portmap
VRS= 6.0
DIR= $(NM)_$(VRS)

FILE= $(NM)-$(VRS).tgz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 8133aaf1bdb0d0ba0b2d26e116e1e0397a3f027b

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
