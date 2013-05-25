# alsa-lib Makefile

NAME= alsa-lib
VER= 1.0.21
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://alsa.cybermirror.org/lib/alsa-lib-1.0.21.tar.bz2
SHA-$(FILE)= cac69df85692ac407c4c80e7ca7a016ee8f35918

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure
	make
	make install
	install -v -m644 -D doc/asoundrc.txt \
	  /usr/share/doc/$(DIR)/asoundrc.txt


clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
