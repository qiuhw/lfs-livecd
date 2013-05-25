# Joe Makefile

NAME= joe
VER= 3.7
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://downloads.sourceforge.net/joe-editor/joe-3.7.tar.gz
SHA-$(FILE)= 54398578886d4a3d325aece52c308a939d31101d

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
