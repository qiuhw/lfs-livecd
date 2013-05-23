# Linux-headers Makefile

NM= linux
VRS= 2.6.32.8
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.32.8.tar.bz2
SHA-$(FILE)= 9f021c6f225ab01a39c1c474ab2dd8800e80976b

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	make mrproper
	make headers_check
	make INSTALL_HDR_PATH=dest headers_install
	cp -rv dest/include/* /tools/include

chroot:
	chroot "$(LFS)" $(chenv-pre-bash) \
	'cd $(MY_ROOT) && make ch-$(NM) $(chbash-pre-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make mrproper
	make headers_check
	make INSTALL_HDR_PATH=dest headers_install
	cp -rv dest/include/* /usr/include

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean chroot compile-stage2
