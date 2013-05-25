# dosfstools Makefile

NAME= dosfstools
VER= 3.0.9
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://daniel-baumann.ch/files/software/dosfstools/dosfstools-3.0.9.tar.bz2
SUM-$(FILE)= 9e2b458e6aa4fabb152a49dc6367a50a625d08dd

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make
	make MANDIR=/usr/share/man/man8 install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
