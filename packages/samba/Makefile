# Samba Makefile

NAME= samba
VER= 3.5.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.samba.org/pub/samba/stable/samba-3.5.2.tar.gz
SUM-$(FILE)= f49733ea2fb9715bd4ec24d7ec96668cc6a97a1f

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cd source3 ; ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
	 	--localstatedir=/var \
	 	--with-piddir=/var/run \
	 	--with-pammodulesdir=/lib/security \
	 	--with-fhs
	cd source3 ; make
	cd source3 ; make install
	cd source3 ; install -v -m644 ../examples/smb.conf.default /etc/samba
	install -m644 $(MY_ROOT)/etc/samba/smb.conf /etc/samba

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
