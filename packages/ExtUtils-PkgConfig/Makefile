# ExtUtils-PkgConfig Makefile

NAME= ExtUtils-PkgConfig
VRS= 1.12
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/ExtUtils-PkgConfig-1.12.tar.gz
SHA-$(FILE)= cb61eb3c4dd6d4689ce945e3f7b8d3a1f9db7dc8

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
