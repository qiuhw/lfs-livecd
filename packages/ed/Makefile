# Ed Makefile

NAME= ed
VER= 1.4
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/ed/ed-1.4.tar.gz
SHA-$(FILE)= 367bb9cd20b584ba550f7eda727a90862d014fe3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install
	make install-man

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
