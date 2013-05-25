# pixman Makefile

NAME= pixman
VER= 0.15.20
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.x.org/pub/individual/lib/pixman-0.15.20.tar.gz
SHA-$(FILE)= a5f973b6895e269731964fbe328f61a8cbfdc931

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
