# manpages-ru Makefile

NM= manpages-ru
VRS= 0.98
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= b5eb5ae4eaa7abc7e4065cf7286efc03106379a1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cp -r man? /usr/share/man/ru

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
