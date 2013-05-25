# gstreamer Makefile

NAME= gstreamer
VRS= 0.10.25
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.25.tar.bz2
SHA-$(FILE)= e3cda2dcac9dbbfc2e61ba79fcd3bff1313dc7f4

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/\(.*gtkdoc-rebase --relative.* \)\(;.*\)/\1|| true\2/' \
		docs/{gst,libs}/Makefile.in
	./configure --prefix=/usr
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
