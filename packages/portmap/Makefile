# portmap Makefile

NAME= portmap
VER= 6.0
DIR= $(NAME)_$(VER)

FILE= $(NAME)-$(VER).tgz
URL-$(FILE)= http://ftp.osuosl.org/pub/blfs/6.3/p/portmap-6.0.tgz
SUM-$(FILE)= 8133aaf1bdb0d0ba0b2d26e116e1e0397a3f027b

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
