# pptp Makefile

NM= pptp
VRS= 1.7.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 1007eb1d4d21629fab390903e8b394d6157b4983

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make OPTIMIZE="-O2 -pipe"
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
