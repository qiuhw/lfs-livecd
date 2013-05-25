# Expect Makefile

NM= expect
DIR= $(NM)5.45

FILE= $(DIR).tar.gz
URL-$(FILE)= http://prdownloads.sourceforge.net/expect/expect5.45.tar.gz
SUM-$(FILE)= 44e1a4f4c877e9ddc5a542dfa7ecc92b

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i 's:/usr/local/bin:/bin:' configure
	./configure \
		--prefix=/tools \
		--with-tcl=/tools/lib \
		--with-tclinclude=/tools/include \
	make
	make SCRIPTS="" install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean
