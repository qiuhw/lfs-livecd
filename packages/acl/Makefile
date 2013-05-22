# acl Makefile

NM= acl
VRS= 2.2.49
DIR= $(NM)-$(VRS)

FILE= $(DIR).src.tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 6f223daa5aafc8a6d29dbf579c82e86312aeb75d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i "s|/@pkg_name@|&-@pkg_version@|" include/builddefs.in
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib
	make
	make install install-dev install-lib
	
clean:
	-rm -rf $(DIR) 

.PHONY: clean compile-stage2
