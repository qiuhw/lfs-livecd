# SCIM-Hangul Makefile

NAME= scim-hangul
VER= 0.3.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/scim/files/scim-hangul/0.3.2/scim-hangul-0.3.2.tar.gz
SUM-$(FILE)= d1f4a2114d284c926d64fbfe8ea83307b8d8e2ec

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	$(shell sed -i 's/<config.h>/&\n  #include <cstring>/' src/scim_hangul_imengine.cpp src/scim_hangul_imengine_setup.cpp) 
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
