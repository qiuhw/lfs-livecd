# hibernate-script Makefile

# Do not update - new versions are buggy (call hooks more than once)
NM= hibernate-script
VRS= 1.91
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://at-mirror.tuxonice.net/downloads/all/$(FILE)
SHA-$(FILE)= b81808f499068937a9696e977ef1cfd499d21eee

PATCH1=$(DIR)-lfs-3.patch

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	rm -rf /etc/hibernate
	yes | PREFIX=/usr MAN_DIR=/usr/share/man ./install.sh

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
