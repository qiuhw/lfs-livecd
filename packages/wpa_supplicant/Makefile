# wpa_supplicant Makefile

NAME= wpa_supplicant
VER= 0.6.10
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://wl500g.googlecode.com/svn-history/r3173/branches/rt-n/wpa_supplicant/wpa_supplicant-0.6.10.tar.gz
SHA-$(FILE)= d2c93758607de250a8dda7adc8f8b304d0a074ce

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cd $(NAME) ; cp defconfig .config
	cd $(NAME) ; make
	cd $(NAME) ; install -m755 $(NAME) wpa_passphrase wpa_cli /usr/bin
	mkdir -p /etc/$(NAME)
	cd $(NAME) ; cp examples/*.conf /etc/$(NAME)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
