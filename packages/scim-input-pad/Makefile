# SCIM-Input-Pad Makefile

NAME= scim-input-pad
VER= 0.1.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/scim/files/scim-input-pad/0.1.2/scim-input-pad-0.1.2.tar.gz
SUM-$(FILE)= e3c5bceba046f627ef0db22c7ab4142f61ba38dc

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
