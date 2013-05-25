# Linux-headers Makefile
# The Linux API Headers expose the kernel's API for use by Glibc.

DIR= linux-3.9.2
FILE= $(DIR).tar.xz
URL-$(FILE)= http://www.kernel.org/pub/linux/kernel/v3.x/$(FILE)
SUM-$(FILE)= e406cc1bb5618a4ea88470f4d3d3d6e1

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
