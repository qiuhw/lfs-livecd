# man-pages-fr Makefile

NM= man-pages-fr
VRS= 3.03.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= de913b8cecba855b58f7bcc05a5c28c0d470c48b

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install
	
clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
