# Kochi fonts Makefile

NAME= kochi-substitute
VER= 20030809
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/kochi-substitute-20030809.tar.bz2
SUM-$(FILE)= 9c48f3ba33558b4d48e7764b944fcb2f5f941dd8

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) 
	$(std_build)

compile-stage2:
	cp -v ./*.ttf /usr/share/fonts

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
