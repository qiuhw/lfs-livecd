# BLFS Bootscripts Makefile

NAME= blfs-bootscripts
VER= 20090302
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.cross-lfs.org/pub/blfs/conglomeration/blfs-bootscripts/blfs-bootscripts-20090302.tar.bz2
SUM-$(FILE)= ef50182fd20b89c2cb081c1d07a7371e0da47cc3

PATCH1=$(NAME)-add-autosshd-1.patch

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	make install-service-dhcpcd
	make install-service-pppoe
	make install-gpm
	make install-autosshd
	make install-dbus
	install -m754 blfs/init.d/sshd /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/random /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/portmap /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/nfs-server /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/nfs-client /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/rsyncd /etc/rc.d/init.d/
	sed -i 's| --compress||' /etc/rc.d/init.d/rsyncd

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
