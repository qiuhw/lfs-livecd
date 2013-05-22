# multipath-tools Makefile
#
# This Makefile installs only kpartx, because other parts require AIO
# and can't be tested without the hardware
#
# Udev rules are not installed, because they rely on a patched dmsetup

NM= multipath-tools
VRS= 0.4.8
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://christophe.varoqui.free.fr/$(NM)/$(FILE)
SHA-$(FILE)= aadc7c7ed072c3df2e32c64a2ab1ba7fac850d7a

# Fixes support for extended partitions
# Incomplete, deactivation doesn't work for the first try
PATCH1= $(DIR)-fix_extpart-1.patch

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	make -C kpartx
	install -m755 kpartx/kpartx /sbin
	install -m644 kpartx/kpartx.8 /usr/share/man/man8

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
