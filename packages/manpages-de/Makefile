# manpages-de Makefile

NAME= manpages-de
VER= 0.5
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/manpages-de-0.5.tar.gz
SHA-$(FILE)= afab7e0ecb27b04a126ad89fd5ea557af66cd329

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cp -r man? /usr/share/man/de

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
