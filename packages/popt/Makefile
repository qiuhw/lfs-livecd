# popt Makefile

NAME= popt
VER= 1.15
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://cursosistemasembebidos.googlecode.com/svn-history/r8/trunk/buildroot/dl/popt-1.15.tar.gz
SUM-$(FILE)= d9bc3067a4e7e62ac0bd9818e8cd649ee0dd12dc

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
