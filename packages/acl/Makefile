# acl Makefile

NAME= acl
VER= 2.2.49
DIR= $(NAME)-$(VER)

FILE= $(DIR).src.tar.gz
URL-$(FILE)= http://download.savannah.gnu.org/releases/acl/acl-2.2.49.src.tar.gz
SUM-$(FILE)= 6f223daa5aafc8a6d29dbf579c82e86312aeb75d

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
