# Sed Makefile

NM= sed
VRS= 4.2.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= ace93d23eabc00d3a8187ecf07d3a02b1b297810

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE)
	$(std_build)

compile-prebuild:
	./configure \
		--prefix=$(TT) \
		--disable-nls \
		ac_cv_header_stdbool_h=yes
	make
	make install

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT)
	make
	make install

chroot:
	chroot "$(MP)" $(chenv-pre-bash) \
	'cd $(MY_ROOT) && make ch-$(NM) $(chbash-pre-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--bindir=/bin \
		--htmldir=/usr/share/doc/sed-4.2.1
	make
	make html
	make install
	make -C doc install-html

clean:
	-rm -rf $(DIR)

.PHONY: compile-prebuild compile-stage1 clean chroot compile-stage2
