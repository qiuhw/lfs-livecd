# Nano Makefile

NAME= nano
VER= 2.2.4
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/nano/nano-2.2.4.tar.gz
SUM-$(FILE)= c69f70d30883e846f74951c5daa20d7c5a6f0662

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc/nano \
		--enable-color \
	 	--enable-multibuffer \
	 	--enable-nanorc
	make
	make install
	install -v -m644 -D doc/nanorc.sample /etc/nano/nanorc.sample 
	install -v -m755 -d /usr/share/doc/$(DIR)
	install -v -m644 doc/{,man/,texinfo/}*.html /usr/share/doc/$(DIR)
	cp $(MY_ROOT)/etc/nanorc /etc/nano

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
