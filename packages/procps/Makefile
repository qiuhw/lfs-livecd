# procps Makefile

NM= procps
VRS= 3.2.8
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= a0c86790569dec26b5d9037e8868ca907acc9829

PATCH= $(DIR)-watch_unicode-1.patch
URL-$(PATCH)= $(HTTP)/$(NM)/$(PATCH)
SHA-$(PATCH)= 70eb76e7370448213130d5520d8132f0bd1c761f

# Targets

include $(MY_ROOT)/scripts/functions

stage2: $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
