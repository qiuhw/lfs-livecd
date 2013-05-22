# notification-daemon-xfce Makefile

NM= notification-daemon-xfce
VRS= 0.3.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://goodies.xfce.org/releases/notification-daemon-xfce/$(FILE)
SHA-$(FILE)= 6edc6a21df03514880abe892befe4a7a58437107

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/glib-server/glib-server --prefix=/' src/daemon/Makefile.in
	./configure --prefix=/usr --libexecdir=/usr/sbin
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
