# DejaVu fonts Makefile

NAME= dejavu-fonts-ttf
VER= 2.30
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/dejavu/files/dejavu/2.30/dejavu-fonts-ttf-2.30.tar.bz2
SUM-$(FILE)= 3a09830033f74be6e370155410091f76193f5528

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cp -v ttf/*.ttf /usr/share/fonts

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
