# flac Makefile

NM= flac
VRS= 1.2.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= bd54354900181b59db3089347cc84ad81e410b38

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/#include <stdio.h>/&\n#include <string.h>/' \
    	examples/cpp/encode/file/main.cpp 
	./configure \
		--prefix=/usr \
		--disable-thorough-tests
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
