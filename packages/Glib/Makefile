# Glib (perl module) Makefile

NAME= Glib
VER= 1.222
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/gtk2-perl/files/Glib/1.222/Glib-1.222.tar.gz
SUM-$(FILE)= 526bbd4058a0cbbef22b5a87d07f8f3dbd7fae0d

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
