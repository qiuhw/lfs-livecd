# DDCControl Monitor Database Makefile

NAME= ddccontrol-db
VER= 20061014
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/ddccontrol/files/ddccontrol-db/20061014/ddccontrol-db-20061014.tar.bz2
SUM-$(FILE)= 9d06570fdbb4d25e397202a518265cc1173a5de3

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
