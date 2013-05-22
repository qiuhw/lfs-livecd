# LibXML2 Makefile

NM= libxml2
VRS= 2.7.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 8592824a2788574a172cbddcdc72f734ff87abe3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --with-history
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
