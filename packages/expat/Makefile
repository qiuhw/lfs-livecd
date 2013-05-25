# Expat Makefile

NAME= expat
VRS= 2.0.1
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://nchc.dl.sourceforge.net/project/expat/expat/2.0.1/expat-2.0.1.tar.gz
SHA-$(FILE)= 663548c37b996082db1f2f2c32af060d7aa15c2d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) 
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install
	install -v -m755 -d /usr/share/doc/$(DIR)
	install -v -m644 doc/*.{html,png,css} /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
