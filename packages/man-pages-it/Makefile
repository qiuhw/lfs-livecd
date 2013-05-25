# man-pages-it Makefile

NAME= man-pages-it
VER= 2.80
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= ftp://ftp.pluto.it/pub/pluto/ildp/man/man-pages-it-2.80.tar.gz
SHA-$(FILE)= 26f96df626922f636017316a64458779d087a498

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	find . -type d -exec chmod 755 '{}' \;
	find . -type f -exec chmod 644 '{}' \;
	cp -r man? /usr/share/man/it

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
