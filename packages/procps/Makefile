NAME = procps-ng
VER  = 3.3.8
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://sourceforge.net/projects/$(NAME)/files/Production/$(FILE)
SUM-$(FILE) = aecbeeda2ab308f8d09dddcb4cb9a572

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr \
		--exec-prefix= \
		--libdir=/usr/lib \
		--docdir=/usr/share/doc/procps-ng-3.3.8 \
		--disable-static \
		--disable-skill \
		--disable-kill
	make
	sed -i -r 's|(pmap_initname)\\\$$|\1|' testsuite/pmap.test/pmap.exp
	make check
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
