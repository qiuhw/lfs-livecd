# Boehm GC Makefile

NAME= gc
VER= 6.8
DIR= $(NAME)$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc6.8.tar.gz
SUM-$(FILE)= 6d5def5ba5d29292ba9c76f04df3ec06d3ab3278

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) 
	$(std_build)

compile-stage2:
	sed -i "s|\$$(datadir)/@PACKAGE@|&-$(VER)|" doc/Makefile.in
	./configure --prefix=/usr --datadir=/usr/share/doc --enable-cplusplus
	make
	make install
	install -v -m644 doc/gc.man /usr/share/man/man3/gc_malloc.3
	ln -sf gc_malloc.3 /usr/share/man/man3/gc.3

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
