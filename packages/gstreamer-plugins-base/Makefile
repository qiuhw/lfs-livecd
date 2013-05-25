# gstreamer-plugins-base Makefile

NAME= gst-plugins-base
VER= 0.10.25
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-0.10.25.tar.bz2
SUM-$(FILE)= 6057e6552c936f3dbe9ba01269bc0bcf8469ae0a

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/\(.*gtkdoc-rebase --relative.* \)\(;.*\)/\1|| true\2/' \
		docs/libs/Makefile.in
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
