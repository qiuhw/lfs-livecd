# parted Makefile

NAME= parted
VRS= 2.2
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/parted/parted-2.2.tar.gz
SHA-$(FILE)= 95c4710c527020ae7d76ebbc67d2639c71af862e

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
