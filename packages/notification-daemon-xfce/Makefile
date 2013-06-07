NAME = notification-daemon-xfce
VER  = 0.3.6
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.bz2
URL-$(FILE) = http://goodies.xfce.org/releases/notification-daemon-xfce/$(FILE)
SUM-$(FILE) = 6edc6a21df03514880abe892befe4a7a58437107

include $(ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/glib-server/glib-server --prefix=/' src/daemon/Makefile.in
	./configure --prefix=/usr --libexecdir=/usr/sbin
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
