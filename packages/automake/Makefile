# Automake Makefile

NAME= automake
VRS= 1.11.1
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/automake/automake-1.11.1.tar.bz2
SHA-$(FILE)= 44ab0007d8edbe82338e29bdda2f461f43a98818

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
