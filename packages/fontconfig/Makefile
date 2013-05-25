# Fontconfig Makefile

NAME= fontconfig
VRS= 2.8.0
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.8.0.tar.gz
SHA-$(FILE)= 570fb55eb14f2c92a7b470b941e9d35dbfafa716

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc \
	 --localstatedir=/var \
	 --disable-docs --without-add-fonts \
	 --with-docdir=/usr/share/doc/$(DIR)
	make
	make install
	install -v -m644 doc/*.3 /usr/share/man/man3
	install -v -m644 doc/*.5 /usr/share/man/man5

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
