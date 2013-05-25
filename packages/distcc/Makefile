# distcc Makefile

NAME= distcc
VER= 3.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://distcc.googlecode.com/files/distcc-3.1.tar.bz2
SUM-$(FILE)= 30663e8ff94f13c0553fbfb928adba91814e1b3a

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
