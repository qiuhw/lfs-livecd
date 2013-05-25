# libcap Makefile

NAME= libcap
VER= 2.19
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.sunet.se/pub/Linux/kernel.org/linux/libs/security/linux-privs/libcap2/libcap-2.19.tar.gz
SUM-$(FILE)= c6e3c8b3962bab2399824dd3091d4921d2a2b89e

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
