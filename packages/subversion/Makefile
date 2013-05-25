# Subversion Makefile

NAME= subversion
VER= 1.6.11
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://archive.apache.org/dist/subversion/subversion-1.6.11.tar.bz2
SHA-$(FILE)= 36cf9d39c14e5bd8d713302ac770c3964fe196b3

FILE2= $(NAME)-deps-$(VER).tar.bz2
URL-$(FILE2)= http://subversion.tigris.org/downloads/subversion-deps-1.6.11.tar.bz2
SHA-$(FILE2)= bb65755933c385122918ab1f60f7715ebd4b52df

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE2)
	$(std_build)

compile-stage2:
	tar --strip-components=1 -xvf ../$(FILE2)
	./configure --prefix=/usr
	make
	make install
	install -v -d -m755 /usr/share/doc/$(DIR)
	cp -v -R doc/* /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
