# Psmisc Makefile

NAME= psmisc
VER= 22.10
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://prdownloads.sourceforge.net/psmisc/psmisc-22.10.tar.gz
SUM-$(FILE)= 20bfa81ec36603c6a141bd7e6137cf9d3b52c3d9

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
