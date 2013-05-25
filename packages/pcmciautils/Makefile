# Sysfsutils Makefile

NAME= pcmciautils
VER= 017
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://ftp.osuosl.org/pub/linux/utils/kernel/pcmcia/pcmciautils-017.tar.bz2
SHA-$(FILE)= 5605e1b13fdfcb08b5742865dc4ad475cbefe501

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make
	make SYMLINK="ln -sf" install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
