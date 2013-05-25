# attr Makefile

NAME= attr
VER= 2.4.44
DIR= $(NAME)-$(VER)

FILE= $(DIR).src.tar.gz
URL-$(FILE)= http://download.savannah.gnu.org/releases/attr/attr-2.4.44.src.tar.gz
SHA-$(FILE)= 7dcbdaac57dcc81b9c36d6c49d25b22b48b5e11f

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib
	make
	make install install-dev install-lib
	mv /usr/share/doc/attr /usr/share/doc/attr-2.4.44

clean:
	-rm -rf $(DIR) 

.PHONY: clean compile-stage2
