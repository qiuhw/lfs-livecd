# liboil Makefile

NAME= liboil
VER= 0.3.17
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://liboil.freedesktop.org/download/liboil-0.3.17.tar.gz
SUM-$(FILE)= f9d7103a3a4a4089f56197f81871ae9129d229ed

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
