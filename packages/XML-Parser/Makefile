# XML-Parser Makefile

NM= XML-Parser
VRS= 2.36
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/perl-modules/$(FILE)
SHA-$(FILE)= 74acac4f939ebf788d8ef5163cbc9802b1b04bfa

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
