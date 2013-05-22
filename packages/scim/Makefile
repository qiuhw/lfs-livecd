# SCIM Makefile

NM= scim
VRS= 1.4.9
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 7717339575fdbf909309a78882e30c60cce9f8eb

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	# The following only tested on 1.4.9 - uses a specific line number
	sed -i '3364s/char/const &/' src/ltdl.cpp
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install
	gtk-query-immodules-2.0 >/etc/gtk-2.0/gtk.immodules

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
