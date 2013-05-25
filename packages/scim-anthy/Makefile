# SCIM-Anthy Makefile

NAME= scim-anthy
VER= 1.3.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.jp/projects/scim-imengine/downloads/29660/scim-anthy-1.3.1.tar.gz
SUM-$(FILE)= 7c71c86deafab0f9a9844e77bbd75e71463dc36a

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
