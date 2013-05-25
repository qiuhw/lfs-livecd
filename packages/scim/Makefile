# SCIM Makefile

NAME= scim
VER= 1.4.9
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/scim/files/scim/1.4.9/scim-1.4.9.tar.gz
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
