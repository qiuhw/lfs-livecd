# eject Makefile

NAME= eject
VER= 2.1.0
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.home.vim.org/vol/2/metalab/utils/disk-management/eject-2.1.0.tar.gz
SUM-$(FILE)= 92059323f43093ab9f01690c97fb35f14eff4c53

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	autoreconf --force --install --verbose
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
