# pptp Makefile

NAME= pptp
VRS= 1.7.2
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/pptpclient/files/pptp/pptp-1.7.2/pptp-1.7.2.tar.gz
SHA-$(FILE)= 1007eb1d4d21629fab390903e8b394d6157b4983

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make OPTIMIZE="-O2 -pipe"
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
