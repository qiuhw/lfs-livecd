# speechd-up Makefile

NM= speechd-up
VRS= 0.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.freebsoft.org/pub/projects/speechd-up/$(FILE)
SHA-$(FILE)= ad31c9a15fd8f5616aff4d35713f736ad8266a92

PATCH1= speechd-up-0.4-onechar-1.patch

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
