NAME = findutils
VER  = 4.4.2
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 351cc4adb07d54877fa15f75fb77d39f

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=/tools
	make
	make install

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr \
		--libexecdir=/usr/lib/findutils \
	 	--localstatedir=/var/lib/locate
	make
	make check
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
