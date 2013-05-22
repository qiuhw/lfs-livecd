# man-pages-es Makefile

NM= man-pages-es
VRS= 1.55
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 1d72e80d0c41f9e5c24ba6a4eea161fc151ec5b5

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	mv man7/iso_8859-2.7{,X}
	mv man7/iso_8859-7.7{,X}
	sh ../convert-mans UTF-8 ISO-8859-1 man?/*.?
	mv man7/iso_8859-2.7{X,}
	mv man7/iso_8859-7.7{X,}
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
