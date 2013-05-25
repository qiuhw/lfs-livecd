# msmtp Makefile

NAME= msmtp
VER= 1.4.20
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/msmtp/files/msmtp/1.4.20/msmtp-1.4.20.tar.bz2
SHA-$(FILE)= 6668ed503b6647365358b8dd821535b1ff9e2c15

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
