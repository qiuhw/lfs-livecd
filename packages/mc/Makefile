# MC Makefile

NAME= mc
VER= 4.7.1
DIR= $(NAME)-$(VER)

FILE= $(NAME)-$(VER).tar.bz2
URL-$(FILE)= http://ftp.osuosl.org/pub/midnightcommander/mc-4.7.1.tar.bz2
SUM-$(FILE)= 61fd896780798d17bd1e41ee3910e36a4b0d306a

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	CPPFLAGS="-DUTF8" ./configure --prefix=/usr --enable-charset
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
