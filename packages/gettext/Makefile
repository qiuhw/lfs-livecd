# Gettext Makefile

NAME= gettext
VER= 0.17
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/gettext/gettext-0.17.tar.gz
SUM-$(FILE)= c51803d9f745f6ace36bd09c0486d5735ce399cf

PATCH= $(DIR)-upstream_fixes-2.patch
URL-$(PATCH)= http://www.linuxfromscratch.org/patches/lfs/6.6/gettext-0.17-upstream_fixes-2.patch
SUM-$(PATCH)= 6bc51e592c8f6400f0c4501c9d0364ef4151b45b

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	cd $(NAME)-tools ; ./configure --prefix=/tools --disable-shared
	cd $(NAME)-tools ; make -C gnulib-lib
	cd $(NAME)-tools ; make -C src msgfmt
	cd $(NAME)-tools ; cp -v src/msgfmt /tools/bin

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
