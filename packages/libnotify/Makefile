# libnotify Makefile

NAME= libnotify
VER= 0.4.4
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.galago-project.org/files/releases/source/libnotify/$(FILE)
SUM-$(FILE)= 24b86673c6673c72b9ad85a8082c884af26e9ce0

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
