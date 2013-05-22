# OpenSSH Makefile

NM= openssh
VRS= 5.5p1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 361c6335e74809b26ea096b34062ba8ff6c97cd6

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	install -v -d -m700 /var/lib/sshd
	chown root:sys /var/lib/sshd
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc/ssh \
		--datadir=/usr/share/sshd \
		--libexecdir=/usr/lib/openssh \
		--with-md5-passwords \
		--with-privsep-path=/var/lib/sshd \
		--with-xauth=/usr/bin/xauth
	make
	make install-nokeys
	install -v -m755 -d /usr/share/doc/$(DIR)
	install -v -m644 INSTALL LICENCE OVERVIEW README* WARNING.RNG \
	 /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
