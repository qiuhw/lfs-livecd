# URI Makefile

NAME= URI
VER= 1.54
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-1.54.tar.gz
SUM-$(FILE)= e0ef831aed3b3dd44b3027075b610a81c135ddae

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
