# Sysfsutils Makefile

NM= sysfsutils
VRS= 2.1.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= b3cb316c652b09ec66f93f4ea98a93a7a1001678

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --libdir=/lib
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
