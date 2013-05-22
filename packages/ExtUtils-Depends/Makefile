# ExtUtils-Depends Makefile

NM= ExtUtils-Depends
VRS= 0.302
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/perl-modules/$(FILE)
SHA-$(FILE)= 94a5e869b53acfd94632fcbabd7dd6568bb4f778

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
