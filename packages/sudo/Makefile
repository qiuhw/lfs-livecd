# sudo Makefile

NAME= sudo
VER= 1.7.2p6
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://contribsoft.caixamagica.pt/export/2312/packages/cm15/sudo/current/SOURCES/sudo-1.7.2p6.tar.gz
SUM-$(FILE)= 45976e82cc2ca9f34cad574629ddd998c377734e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib \
	 	--enable-noargs-shell \
	 	--with-ignore-dot \
	 	--with-all-insults \
	 	--enable-shell-sets-home \
	 	--with-pam=no
	make
	rm -f /etc/sudoers
	echo 'jhalfs    ALL=(ALL) NOPASSWD:ALL' >>sudoers
	env -i PATH=$$PATH make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
