# startup-notification Makefile

NAME= startup-notification
VER= 0.9
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.lfs-matrix.net/pub/blfs/6.3/s/startup-notification-0.9.tar.bz2
SUM-$(FILE)= 2c09f43247683d1e4a16b2f8d1e236b57eafae68

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
