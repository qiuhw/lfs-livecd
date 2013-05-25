# Libstdc++ Makefile
# Libstdc++ is the standard C++ library. It is needed for the correct operation of the g++ compiler.

NM= gcc
VRS= 4.8.0
DIR= $(NM)-$(VRS)
FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.gnu.org/gnu/$(NM)/$(DIR)/$(FILE)
SUM-$(FILE)= e6040024eb9e761c3bea348d1fa5abb0

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	../$(DIR)/libstdc++-v3/configure \
		--host=$(LFS_TGT) \
		--prefix=/tools \
		--disable-multilib \
		--disable-shared \
		--disable-nls \
		--disable-libstdcxx-threads \
		--disable-libstdcxx-pch \
		--with-gxx-include-dir=/tools/$LFS_TGT/include/c++/$(VRS)
	make
	make install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-stage1 clean
