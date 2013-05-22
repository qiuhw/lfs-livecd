# Makefile for initramfs included on the LFS livecd

NM= initramfs
VRS= 1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile init.in
	@make compile-$@
	@make clean
	@touch $@

compile-stage2:
	mkdir -p /usr/share/initramfs
	cp fakecd.iso.head /usr/share/initramfs
	sed -e 's/@LINKER@/$(LINKER)/' init.in >/usr/share/initramfs/init.in
	sed -e 's/@LINKER@/$(LINKER)/' create-initramfs.in > /usr/bin/create-initramfs
	chmod 755 /usr/bin/create-initramfs

clean:

.PHONY: clean compile-stage2
