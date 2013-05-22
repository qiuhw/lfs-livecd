# Thai fonts Makefile

NM= thai-ttf
VRS= 0.4.5
DIR= usr
LOCATION= /usr/share/fonts

FILE= $(NM)-$(VRS).tar.gz
URL-$(FILE)= http://linux.thai.net/pub/thailinux/software/thai-ttf/$(FILE)
SHA-$(FILE)= 02e94e471b2b29845f4dbbde6056b34fac0d1611

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(FILE) 
	$(std_build)

compile-stage2:
	cp -v share/fonts/th/TTF/*.ttf $(LOCATION)

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
