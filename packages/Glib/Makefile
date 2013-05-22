# Glib (perl module) Makefile

NM= Glib
VRS= 1.222
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/perl-modules/$(FILE)
SHA-$(FILE)= 526bbd4058a0cbbef22b5a87d07f8f3dbd7fae0d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	perl Makefile.PL
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
