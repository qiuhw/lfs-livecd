# Udev Makefile

NAME= udev
VER= 151
CONFVRS= 20100128
DIR= $(NAME)-$(VER)
CONFDIR=$(NAME)-config-$(CONFVRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev-151.tar.bz2
SUM-$(FILE)= 04bab1fd73797815b0f2412edcf1070acd35bce1

FILE1= $(CONFDIR).tar.bz2
URL-$(FILE1)= http://www.linuxfromscratch.org/lfs/downloads/6.6/udev-config-20100128.tar.bz2
SUM-$(FILE1)= be1dffa11984c65f5d6e5481eca792eecf56a8b5

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE1)
	$(std_build)

compile-stage2:
	tar -xvf ../$(FILE1)
	install -dv /lib/{firmware,udev/devices/{pts,shm}}
	mknod -m0666 /lib/udev/devices/null c 1 3
	ln -sv /proc/self/fd /lib/udev/devices/fd
	ln -sv /proc/self/fd/0 /lib/udev/devices/stdin
	ln -sv /proc/self/fd/1 /lib/udev/devices/stdout
	ln -sv /proc/self/fd/2 /lib/udev/devices/stderr
	ln -sv /proc/kcore /lib/udev/devices/core
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/sbin \
    	--with-rootlibdir=/lib \
    	--libexecdir=/lib/udev \
    	--docdir=/usr/share/doc/udev-151 \
    	--disable-extras \
    	--disable-introspection
	make
	make install
	install -m644 -v rules/packages/64-*.rules /lib/udev/rules.d/
	install -m644 -v rules/packages/40-pilot-links.rules /lib/udev/rules.d/
	install -m644 -v rules/packages/40-isdn.rules /lib/udev/rules.d/
	cd $(CONFDIR) ; make install install-doc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
