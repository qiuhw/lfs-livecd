# speex Makefile

NAME= speex
VRS= 1.2rc1
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz
SHA-$(FILE)= 52daa72572e844e5165315e208da539b2a55c5eb

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
