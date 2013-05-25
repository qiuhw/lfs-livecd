# SCIM-Tables Makefile

NAME= scim-tables
VER= 0.5.9
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/scim/files/scim-tables/0.5.9/scim-tables-0.5.9.tar.gz
SUM-$(FILE)= aeca1c8a2eb10a214edc07fa248cd7450f78e387

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
