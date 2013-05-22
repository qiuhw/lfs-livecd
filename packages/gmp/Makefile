# gmp Makefile

NM= gmp
VRS= 5.0.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 11a49c6fec0a3cfae2df9966d321d740af9f603f

# Targets

include $(MY_ROOT)/scripts/functions

ifeq ($(MY_ARCH), i686)
BUILD_PARAM= --build=i686-pc-linux-gnu
endif

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--enable-cxx \
		$(BUILD_PARAM) \
	 	--enable-mpbsd
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
