# [package-name] Makefile (This is a template for package Makefiles)

NM= [package-name]
VRS= [version-number]
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2 # Use bz2 files wherever possible, especially for lfs-base
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= [sha1sum of $(FILE)]

PATCH1= $(DIR)-some-1.patch
URL-$(PATCH1)= $(HTTP)/$(NM)/$(PATCH1)
SHA-$(PATCH1)= [sha1sum of $(PATCH1)]

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build) # See the scripts/functions file for functions like this

compile-stage1:
	./configure --prefix=$(WD)
	make
	make install

stage2: Makefile $(FILE) $(PATCH1)
	$(sep_dir_build) # Simple function to create a separate build directory

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
