# Man-pages Makefile

NAME= man-pages
VER= 3.23
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.kernel.org/pub/linux/docs/manpages/Archive/man-pages-3.23.tar.bz2
SUM-$(FILE)= 34452a00ccd9a9463d7ca66aeab55d5993a70fa9

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
