# which Makefile

NAME= which
VER= 2.20
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/which/which-2.20.tar.gz
SUM-$(FILE)= 3bcd6d87aa5231917ba7123319eedcae90cfa0fd

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	rm -f /usr/bin/which
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
