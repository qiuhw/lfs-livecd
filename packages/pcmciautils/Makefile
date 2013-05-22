# Sysfsutils Makefile

NM= pcmciautils
VRS= 017
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 5605e1b13fdfcb08b5742865dc4ad475cbefe501

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make
	make SYMLINK="ln -sf" install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
