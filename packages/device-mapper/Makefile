# device-mapper Makefile

NAME= device-mapper
VER= 1.02.21
DIR= $(NAME).$(VER)

FILE= $(DIR).tgz
URL-$(FILE)= ftp://sources.redhat.com/pub/dm/$(FILE)
SUM-$(FILE)= b9ce3e5400cf66e2b5b2eebc672268360c371692

# Targets

include $(ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
