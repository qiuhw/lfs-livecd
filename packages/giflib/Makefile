# giflib Makefile

NAME= giflib
VER= 4.1.6
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://downloads.sourceforge.net/giflib/giflib-4.1.6.tar.bz2
SUM-$(FILE)= 22680f604ec92065f04caf00b1c180ba74fb8562

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
