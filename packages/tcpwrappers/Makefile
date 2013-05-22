# tcpwrappers Makefile

NM= tcpwrappers
VRS= 7.6
DIR= tcp_wrappers_$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/tcp_wrappers/$(FILE)
SHA-$(FILE)= 61689ec85b80f4ca0560aef3473eccd9e9e80481

PATCH1= tcp_wrappers-$(VRS)-shared_lib_plus_plus-1.patch
URL-$(PATCH1)= $(HTTP)/tcp_wrappers/$(PATCH1)
SHA-$(PATCH1)= 915652d43c57f346d6f0a14eeaf706bbfed98ffa

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	sed -i -e "s,^extern char \*malloc();,/* & */," scaffold.c
	make REAL_DAEMON_DIR=/usr/sbin STYLE=-DPROCESS_OPTIONS linux
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
