# W3M Makefile

NAME= w3m
VER= 0.5.2
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://prdownloads.sourceforge.net/w3m/$(FILE)
SUM-$(FILE)= 484522547ae6dbb342d3858a2a53a65451e273f9

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc
	make
	make install
	install -v -D -m 644 doc/keymap.default /etc/w3m/keymap
	install -v -D -m 644 doc/menu.default /etc/w3m/menu
	install -v -d -m 755 /usr/share/doc/w3m-$(VER)/html
	install -v -m 644 doc/{HISTORY,READM*,keymap.*,menu.*,*.html} /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
