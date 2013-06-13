NAME = linux
VER  = 3.9.5
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://www.kernel.org/pub/$(NAME)/kernel/v3.x/$(FILE)
SUM-$(FILE) = d7be63a4e95ddfc80ba3f7852d87016c

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
