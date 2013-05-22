# intltool Makefile

NM= intltool
VRS= 0.40.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 4f6469e09e2c06a8072dffff36f84ff401d7ea75

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install
	install -v -m644 -D doc/I18N-HOWTO /usr/share/doc/$(DIR)/I18N-HOWTO

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
