# Tcl Makefile
# The Tcl package contains the Tool Command Language.

NAME= tcl
DIR= $(NAME)8.6.0
FILE= $(DIR)-src.tar.gz
URL-$(FILE)= http://prdownloads.sourceforge.net/$(NAME)/$(FILE)
SUM-$(FILE)= 573aa5fe678e9185ef2b3c56b24658d3

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i s/500/5000/ generic/regc_nfa.c
	cd unix ; ./configure --prefix=/tools
	cd unix ; make
	cd unix ; TZ=UTC make test
	cd unix ; make install
	chmod u+w /tools/lib/libtcl8.6.so
	cd unix ; make install-private-headers
	ln -s tclsh8.6 /tools/bin/tclsh

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean
