# ExtUtils-Depends Makefile

NAME= ExtUtils-Depends
VER= 0.302
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/ExtUtils-Depends-0.302.tar.gz
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
