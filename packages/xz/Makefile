# xz Utils Makefile

NAME= xz
VER= 4.999.9beta
DIR= $(NAME)-$(VER)

FILE= $(NAME)-$(VER).tar.bz2
URL-$(FILE)= http://tukaani.org/xz/$(FILE)
SUM-$(FILE)= 67cd2598b5149da9b3c126f3483fd632e06b3d48

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
