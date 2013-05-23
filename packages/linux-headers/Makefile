# Linux-headers Makefile
# The Linux API Headers expose the kernel's API for use by Glibc.

DIR= linux-2.6.32.8
FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.kernel.org/pub/linux/kernel/v2.6/$(FILE)
SHA-$(FILE)= 9f021c6f225ab01a39c1c474ab2dd8800e80976b

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	make mrproper
	make headers_check
	make INSTALL_HDR_PATH=dest headers_install
	cp -r dest/include/* /tools/include

stage2: $(FILE)
	$(std_build)

compile-stage2:
	make mrproper
	make headers_check
	make INSTALL_HDR_PATH=dest headers_install
	find dest/include \( -name .install -o -name ..install.cmd \) -delete
	cp -r dest/include/* /usr/include

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
