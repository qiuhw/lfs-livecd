# irssi Makefile

NAME= irssi
VER= 0.8.15
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://irssi.org/files/irssi-0.8.15.tar.bz2
SUM-$(FILE)= b79ce8c2c98a76b004f63706e7868cd363000d89

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install
	cp -a $(MY_ROOT)/root/.irssi /root/.irssi
	for dir in $$(find /root/.irssi -name ".svn") ; do rm -rvf $$dir ; done

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
