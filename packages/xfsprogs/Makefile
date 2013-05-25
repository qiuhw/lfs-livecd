# XFS Progs Makefile

NAME= xfsprogs
VRS= 3.1.1
DIR= $(NAME)-$(VRS)

FILE=$(NAME)-$(VRS).tar.gz
URL-$(FILE)= http://ftp.gwdg.de/pub/linux/misc/xfs/xfs/previous/xfsprogs-3.1.1.tar.gz
SHA-$(FILE)= aff98427443b9944d42652172e4780945da94ab2

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make DEBUG=-DNDEBUG INSTALL_USER=root INSTALL_GROUP=root \
	 LOCAL_CONFIGURE_OPTIONS="--enable-readline=yes"
	make install
	make install-dev
	chmod -v 755 /lib/libhandle.so*
	rm -f /lib/libhandle.{a,la,so}
	ln -svf ../../lib/libhandle.so.1 /usr/lib/libhandle.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
