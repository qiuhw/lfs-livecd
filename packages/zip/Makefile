# Zip Makefile

NAME= zip
VER= 30
DIR= $(NAME)$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://prdownloads.sourceforge.net/infozip/$(FILE)
SUM-$(FILE)= c9f4099ecf2772b53c2dd4a8e508064ce015d182

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make -f unix/Makefile generic_gcc
	make prefix=/usr -f unix/Makefile install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
