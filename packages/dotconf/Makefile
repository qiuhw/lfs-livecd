# dotconf Makefile

NAME= dotconf
VER= 1.0.13
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.azzit.de/dotconf/download/v1.0/dotconf-1.0.13.tar.gz
SUM-$(FILE)= bf0c3a29da525f0be8b896c484b3b518f022998f

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
