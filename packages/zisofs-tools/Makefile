# zisofs-tools Makefile

NAME= zisofs-tools
VER= 1.0.8
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://mirror.linux.org.au/linux/utils/fs/zisofs/zisofs-tools-1.0.8.tar.bz2
SUM-$(FILE)= 9ac33b37dcbe00c6adf51d171156cae87e0b7f22

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/tools CFLAGS="-I/tools/include" LDFLAGS="-L/tools/lib"
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
