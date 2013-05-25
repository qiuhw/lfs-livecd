# xine-lib Makefile

NAME= xine-lib
VER= 1.1.15
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://sourceforge.net/projects/xine/files/xine-lib%201.1/1.1.15/xine-lib%201.1-1.1.15.tar.bz2
SHA-$(FILE)= bcb567ea2a11c5f26b2384d5400b8466ea9048c6

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/\(inline \)\(_x_is_fourcc\)/__\1int \2/' src/xine-engine/buffer.h
	./configure \
		--prefix=/usr \
		--with-internal-vcdlibs \
	    --disable-opengl \
	    --disable-syncfb \
	    --disable-fb \
	    --disable-dxr3 \
	    --disable-optimizations \
	    --with-freetype \
	    --with-fontconfig \
	    --enable-antialiasing
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
