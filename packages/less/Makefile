# Less Makefile 

NAME= less
VRS= 436
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.greenwoodsoftware.com/less/less-436.tar.gz
SHA-$(FILE)= f78998a1a79a7e1962c901dd41bdc3d1c2005471

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
