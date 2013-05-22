# Shadow Makefile

NM= shadow
VRS= 4.1.4.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 43e29471057c671de51360b10e3ee2b419c78ffa

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/groups$$(EXEEXT) //' src/Makefile.in
	find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
	sed -i -e 's/ ko//' -e 's/ zh_CN zh_TW//' man/Makefile.in
	sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD MD5@' \
	 -e 's@/var/spool/mail@/var/mail@' etc/login.defs
	./configure --sysconfdir=/etc
	make
	make install
	mv -v /usr/bin/passwd /bin
	mkdir -pv /etc/default
	pwconv
	grpconv
	useradd -D -b /home
	sed -i 's/yes/no/' /etc/default/useradd

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
