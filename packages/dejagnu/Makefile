# DejaGNU Makefile
# The DejaGNU package contains a framework for testing other programs.

NM= dejagnu
DIR= $(NM)-1.4.4
FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/$(NM)/$(FILE)
SHA-$(FILE)= fd82ffd396eba5b595f76d2f4a068cb7fcc6cffb

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=/tools
	make install
	make check

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean
