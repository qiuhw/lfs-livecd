# strace Makefile

NAME= strace
VRS= 4.5.20
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://prdownloads.sourceforge.net/strace/$(FILE)
SHA-$(FILE)= 3f5c8874610d7e3d13fc1c8b2e5fb5513468c45a

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
