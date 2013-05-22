# Texinfo Makefile

NM= texinfo
VRS= 4.13a
DIR= $(NM)-4.13

FILE= $(DIR)a.tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= a1533cf8e03ea4fa6c443b73f4c85e4da04dead0

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT)
	make
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install
	make TEXMF=/usr/share/texmf install-tex

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
