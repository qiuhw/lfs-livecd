# FreeFont Makefile

NAME= freefont
VER= 20090104
DIR= $(NAME)-$(VER)

FILE= $(NAME)-ttf-$(VER).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/freefont/freefont-ttf-20090104.tar.gz
SUM-$(FILE)= 776393e70028e74062754d48c74fe6829271d182

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cp -v *.ttf /usr/share/fonts

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
