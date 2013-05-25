# Kbd Makefile

NAME= kbd
VER= 1.15.1
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.altlinux.com/pub/people/legion/kbd/kbd-1.15.1.tar.gz
SHA-$(FILE)= a5750125be4ddff84cdcf37f5d5e320a7f3c4c35

PATCH1= $(DIR)-backspace-1.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/lfs/6.6/kbd-1.15.1-backspace-1.patch
SHA-$(PATCH1)= 44f2fb0ac18db4f717421db756db4897f88dc08c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	autoreconf
	patch -Np1 -i ../$(PATCH1)
	./configure --prefix=/usr --datadir=/lib/kbd
	make
	make install
	mv /usr/bin/{kbd_mode,loadkeys,openvt,setfont} /bin
	mkdir -v /usr/share/doc/$(DIR)
	cp -R -v doc/* /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
