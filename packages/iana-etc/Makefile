# Iana-etc Makefile

NAME= iana-etc
VER= 2.30
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sethwklein.net/iana-etc-2.30.tar.bz2
SUM-$(FILE)= 218593bcb9264014c4e397d838b2c218eac9df06

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
