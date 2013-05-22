# manpages-de Makefile

NM= manpages-de
VRS= 0.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= afab7e0ecb27b04a126ad89fd5ea557af66cd329

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cp -r man? /usr/share/man/de

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
