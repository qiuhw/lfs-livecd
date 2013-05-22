# mutt Makefile

NM= mutt
VRS= 1.5.20
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= d2bec7a33771f128ca49b1723b06b6d248a35d31

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	# Fix for new SSL
	sed -i 's@STACK \*@STACK_OF(X509) \*@' mutt_ssl.c
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
	 	--with-docdir=/usr/share/doc/mutt \
	 	--enable-imap \
		--enable-pop \
		--with-ssl \
		--enable-hcache
	make
	make install
	install -m600 $(MY_ROOT)/root/.muttrc /root

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
