# OpenSSL Makefile

NM= openssl
VRS= 1.0.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.openssl.org/source/$(FILE)
SHA-$(FILE)= 3f800ea9fa3da1c0f576d689be7dca3d55a4cb62

DEPS= $(FILE)

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(DEPS)
	$(std_build)

compile-stage2:
	./config --openssldir=/etc/ssl --prefix=/usr shared zlib-dynamic
	make MANDIR=/usr/share/man
	make MANDIR=/usr/share/man install
	cp -r certs /etc/ssl

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
