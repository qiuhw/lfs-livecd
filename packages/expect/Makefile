# Expect Makefile

NM= expect
VRS= 5.43.0
DIR= $(NM)-5.43

FILE= $(NM)-$(VRS).tar.gz
URL-$(FILE)= http://expect.nist.gov/src/$(FILE)
SHA-$(FILE)= 854440d937c1d05103bf2d02f911005b739fa1e9

PATCH1= $(NM)-$(VRS)-spawn-1.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/lfs/6.6/$(PATCH1)
SHA-$(PATCH1)= ba903a7d04b4faa13c8b9db75e1537f55f28e82b

PATCH2= $(NM)-$(VRS)-tcl_8.5.5_fix-1.patch
URL-$(PATCH2)= http://www.linuxfromscratch.org/patches/lfs/6.6/$(PATCH2)
SHA-$(PATCH2)= 268c90379acd02d365f525e9d83017a75f62aa98

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE) $(PATCH1) $(PATCH2)
	$(std_build)

compile-stage1:
	patch -Np1 -i ../$(PATCH1)
	patch -Np1 -i ../$(PATCH2)
	sed -i 's:/usr/local/bin:/bin:' configure
	./configure \
		--prefix=/tools \
		--with-tcl=/tools/lib \
		--with-tclinclude=/tools/include \
		--with-x=no
	make
	make SCRIPTS="" install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean
