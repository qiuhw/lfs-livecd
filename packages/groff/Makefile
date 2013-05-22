# Groff Makefile

NM= groff
VRS= 1.20.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 3066587d73df73c2bda235034f4515cf52d22549

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	PAGE=$(pagesize) ./configure --prefix=/usr
	make
	make install
	ln -sf eqn /usr/bin/geqn
	ln -sf tbl /usr/bin/gtbl

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
