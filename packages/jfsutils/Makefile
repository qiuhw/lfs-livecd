# jfsutils Makefile

NAME= jfsutils
VER= 1.1.11
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://jfs.sourceforge.net/project/pub/$(FILE)
SUM-$(FILE)= 27837760bd65f32758d6048803387b8b3443467f

# Targets

include $(ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sbindir=/sbin
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
