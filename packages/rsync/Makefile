# rsync Makefile

NAME= rsync
VER= 3.0.7
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://mirrors.ibiblio.org/rsync/src/rsync-3.0.7.tar.gz
SHA-$(FILE)= 63426a1bc71991d93159cd522521fbacdafb7a61

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
