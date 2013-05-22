# FreeFont Makefile

NM= freefont
VRS= 20090104
DIR= $(NM)-$(VRS)

FILE= $(NM)-ttf-$(VRS).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 776393e70028e74062754d48c74fe6829271d182

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cp -v *.ttf /usr/share/fonts

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
