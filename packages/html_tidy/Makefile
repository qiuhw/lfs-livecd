# HTML Tidy Makefile

NAME= tidy
VER= cvs_20070326
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.lfs-matrix.net/pub/blfs/conglomeration/tidy/tidy-cvs_20070326.tar.bz2
SUM-$(FILE)= 8a775dea48fac5dacff7879813bce60fd44c2ed0

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
