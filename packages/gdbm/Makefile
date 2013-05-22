# gdbm Makefile

NM= gdbm
VRS= 1.8.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= a0296b1986a99cb9ec0dc3b17ea99aec76e9b760

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install
	make install-compat
	install-info --dir-file=/usr/info/dir /usr/info/gdbm.info

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
