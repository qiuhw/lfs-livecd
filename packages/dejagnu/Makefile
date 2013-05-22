# DejaGNU Makefile

NM= dejagnu
VRS= 1.4.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= fd82ffd396eba5b595f76d2f4a068cb7fcc6cffb

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT) \
		--libdir=$(TT)/$(MY_LIBDIR)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean chroot
