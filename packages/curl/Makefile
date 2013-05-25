# Curl Makefile

NAME= curl
VER= 7.20.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://curl.haxx.se/download/curl-7.20.1.tar.bz2
SUM-$(FILE)= bc3ba6d83069ef1f13d320f29b26f1c63f6056b3

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
