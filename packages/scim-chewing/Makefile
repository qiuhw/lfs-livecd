# scim-chewing Makefile

NAME= scim-chewing
VRS= 0.3.3
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://chewing.googlecode.com/files/scim-chewing-0.3.3.tar.bz2
SHA-$(FILE)= 346d9a1511cfbb1025c0290d5a97a799329cb24e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
