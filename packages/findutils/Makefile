# Findutils Makefile

NM= findutils
VRS= 4.4.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= e8dd88fa2cc58abffd0bfc1eddab9020231bb024

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT)
	make
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/findutils \
	 	--localstatedir=/var/lib/locate
	make
	make install
	mv -v /usr/bin/find /bin
	sed -i -e 's@BINDIR=/usr/bin@BINDIR=/bin@' /usr/bin/updatedb

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
