# bc Makefile

NM= bc
VRS= 1.06
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= c8f258a7355b40a485007c40865480349c157292

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '/PROTO.*readline/d' bc/scan.l
	sed -i '/flex -I8/s/8//' configure
	sed -i '/stdlib/a #include <string.h>' lib/number.c
	sed -i 's/program.*save/static &/' bc/load.c
	./configure --prefix=/usr --with-readline
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
