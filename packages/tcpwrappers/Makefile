# tcpwrappers Makefile

NAME= tcpwrappers
VER= 7.6
DIR= tcp_wrappers_$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://files.ichilton.co.uk/nfs/tcp_wrappers_7.6.tar.gz
SUM-$(FILE)= 61689ec85b80f4ca0560aef3473eccd9e9e80481

PATCH1= tcp_wrappers-$(VER)-shared_lib_plus_plus-1.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/blfs/6.3/tcp_wrappers-7.6-shared_lib_plus_plus-1.patch
SUM-$(PATCH1)= 915652d43c57f346d6f0a14eeaf706bbfed98ffa

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
