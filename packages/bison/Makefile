# Bison Makefile

NM= bison
VRS= 2.4.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= fc96b28ee4a6a914b18cb1eddb68177d94b83361

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	echo '#define YYENABLE_NLS 1' >> config.h
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
