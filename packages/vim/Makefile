# Vim Makefile

NM= vim
VRS= 7.2
DIR= $(NM)72

FILE= $(NM)-$(VRS).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= a4b6641ca528fada71ea77c998a441495ed4984c

FILE2= $(NM)-$(VRS)-lang.tar.gz
URL-$(FILE2)= $(HTTP)/$(NM)/$(FILE2)
SHA-$(FILE2)= 970e0dda7e5b2308cf33488be1ea33d593d951cb

PATCH1= $(NM)-$(VRS)-fixes-5.patch
URL-$(PATCH1)= $(HTTP)/$(NM)/$(PATCH1)
SHA-$(PATCH1)= 10bd3c55d5b8fa416cbe5538d5a9d39110db911e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE2) $(PATCH1)
	$(std_build)

compile-stage2:
	tar --strip-components=1 -xvf ../$(FILE2) 
	patch -Np1 -i ../$(PATCH1)
	echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
	echo '#define SYS_GVIMRC_FILE "/etc/gvimrc"' >> src/feature.h
	./configure --prefix=/usr --with-features=huge
	make
	make install
	ln -sfv vim /usr/bin/vi
	for L in "" fr it pl ru ; do \
	    ln -sfv vim.1 /usr/share/man/$L/man1/vi.1 ; done
	ln -nsfv ../vim/$(DIR)/doc /usr/share/doc/vim-$(VRS)
	cp $(MY_ROOT)/etc/vimrc /etc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
