# FireFly fonts Makefile

NM= fireflysung
VRS= 1.3.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/firefly-fonts/$(FILE)
SHA-$(FILE)= a513386c18257febcbedb72b7a4e4aa21e930002

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) 
	$(std_build)

compile-stage2:
	cp -v ./*.ttf /usr/share/fonts

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
