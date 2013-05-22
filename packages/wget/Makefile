# Wget Makefile

NM= wget
VRS= 1.11.4
DIR= $(NM)-$(VRS)
FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/$(NM)/$(FILE)
SHA-$(FILE)= a78a3b71fd59504df3ff3dbc0a2195a1410e9eac

# Targets

include $(MY_ROOT)/scripts/functions

ftpget:
	@cd $(SRC) ; sh $(MY_ROOT)/scripts/ftpget $(NM) $(VRS)
	@touch $@

prebuild: ftpget $(FILE)
	$(std_build)

compile-prebuild:
	cp -v Makefile.in{,.bak}
	sed -e '/^SUBDIRS/s@ doc@@' -e '/^install:/s@ install.info@@' \
	-e 's/@COMMENT_IF_NO_POD2MAN@install.man//' Makefile.in.bak > Makefile.in
	./configure --prefix=$(TT) --disable-nls
	make
	make install

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
	   --prefix=/tools
	make
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-prebuild clean chroot compile-stage2
