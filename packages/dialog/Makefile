# Dialog Makefile

NM= dialog
VRS= 1.1-20100428
DIR= $(NM)-$(VRS)

FILE= $(DIR).tgz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 6945b302bf5b107c12f6009c25699d265b45579c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--enable-nls \
	    --enable-widec \
	    --with-ncursesw
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
