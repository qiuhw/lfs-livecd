# Ed Makefile

NM= ed
VRS= 1.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 367bb9cd20b584ba550f7eda727a90862d014fe3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install
	make install-man

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
