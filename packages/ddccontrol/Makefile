# DDCControl Makefile

NAME= ddccontrol
VER= 0.4.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/ddccontrol/files/ddccontrol/0.4.2/ddccontrol-0.4.2.tar.bz2
SUM-$(FILE)= fd5c53286315a61a18697a950e63ed0c8d5acff1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	LIBS="-lz" ./configure --prefix=/usr --disable-gnome-applet
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
