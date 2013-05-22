# Mesa Makefile

NM= Mesa
VRS= 7.6
DIR= $(NM)-$(VRS)

FILE= MesaLib-$(VRS).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 4bb10d98afa2585bf60cffb6861b511e86b7b240

FILE1= MesaDemos-$(VRS).tar.bz2
URL-$(FILE1)= $(HTTP)/$(NM)/$(FILE1)
SHA-$(FILE1)= 2d1ba323711b595f93ed5bc98aa0dfe674c7c768

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE1)
	$(std_build)

compile-stage2:
	tar --strip-components=1 -xvf ../$(FILE1) 
	sed 's@FLAGS=\"-g@FLAGS=\"@' -i configure
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var
	make
	make install
	install -v -m755 progs/xdemos/glx{info,gears} /usr/bin

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
