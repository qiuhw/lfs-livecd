# hal information Makefile

NAME= hal-info
VER= 20091130
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://hal.freedesktop.org/releases/hal-info-20091130.tar.gz
SUM-$(FILE)= d548a0d837d39a609c42a789c92578150c18b9f5

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
