# Tcl Makefile

NM= tcl
VRS= 8.5.8
DIR= $(NM)$(VRS)

FILE= $(DIR)-src.tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 21de27a24633c7550383bc7c35736e9acd5cb3a8

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	cd unix ; ./configure \
		--prefix=$(TT)
	cd unix ; make
	cd unix ; make install
	chmod -v u+w $(TT)/lib/libtcl8.5.so
	cd unix ; make install-private-headers
	ln -s tclsh8.5 $(TT)/bin/tclsh

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean chroot
