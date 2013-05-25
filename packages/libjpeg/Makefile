# libjpeg Makefile

NAME= libjpeg
VER= 7
DIR= jpeg-$(VER)

FILE= jpegsrc.v$(VER).tar.gz
URL-$(FILE)= http://www.ijg.org/files/jpegsrc.v7.tar.gz
SUM-$(FILE)= 88cced0fc3dbdbc82115e1d08abce4e9d23a4b47

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
