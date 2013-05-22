# Util-Linux-NG Makefile

NM= util-linux-ng
VRS= 2.17
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 3be54ede41d0aff87a717a0d75c8f3c0171f85f6

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -e 's@etc/adjtime@var/lib/hwclock/adjtime@g' \
	 -i $$(grep -rl '/etc/adjtime' .)
	mkdir -pv /var/lib/hwclock
	./configure \
		--enable-arch \
		--enable-partx \
		--enable-write
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
