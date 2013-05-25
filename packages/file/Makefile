# File Makefile

NAME= file
VRS= 5.04
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.astron.com/pub/file/file-5.04.tar.gz
SHA-$(FILE)= 56ddf7135471aa656334ed8fefe1112bcccc2cc3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
