# SmartyPants Makefile

NM= SmartyPants
VRS= 1.5.1
DIR= $(NM)_$(VRS)

FILE= $(DIR).zip
URL-$(FILE)= http://daringfireball.net/projects/downloads/$(FILE)
SHA-$(FILE)= 339a493f89cfee1e9f051bb1b39f9dcae4c595ca

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	unzip $(FILE)
	# We want to run this outside of the chroot
	sed -i 's/usr/tools/' $(DIR)/SmartyPants.pl
	install -m755 $(DIR)/SmartyPants.pl /tools/bin/SmartyPants
	make clean
	@touch $@

clean:
	-rm -rf $(DIR)

.PHONY: clean
