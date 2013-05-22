# gstreamer Makefile

NM= gstreamer
VRS= 0.10.25
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
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
