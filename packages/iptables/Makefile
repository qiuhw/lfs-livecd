# iptables Makefile

NAME= iptables
VER= 1.4.7
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.netfilter.org/projects/iptables/files/iptables-1.4.7.tar.bz2
SUM-$(FILE)= 825594a2c5017852b03ce441f592c67070b4b29c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--bindir=/sbin \
        --sbindir=/sbin \
        --libdir=/lib \
        --libexecdir=/lib \
        --with-pkgconfigdir=/usr/lib/pkgconfig
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
