# hicolor-icon-theme Makefile

NAME= hicolor-icon-theme
VER= 0.11
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://icon-theme.freedesktop.org/releases/hicolor-icon-theme-0.11.tar.gz
SHA-$(FILE)= 8a870f13254f1704bc2e7bb4fa1258d07ba5cc8e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
