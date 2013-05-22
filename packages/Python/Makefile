# Python Makefile

NM= Python
VRS= 2.6.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 24c94f5428a8c94c9d0b316e3019fee721fdb5d1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--enable-shared
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
