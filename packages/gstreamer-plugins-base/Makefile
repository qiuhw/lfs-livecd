# gstreamer-plugins-base Makefile

NM= gst-plugins-base
VRS= 0.10.25
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/gstreamer/$(FILE)
SHA-$(FILE)= 6057e6552c936f3dbe9ba01269bc0bcf8469ae0a

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
