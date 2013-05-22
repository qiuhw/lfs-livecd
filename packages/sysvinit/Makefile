# Sysvinit Makefile

NM= sysvinit
VRS= 2.86
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 3e78df609a2ff0fea6304cb662a7f10298d03667

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's@Sending processes@& configured via /etc/inittab@g' src/init.c
	sed -i -e 's/utmpdump wall/utmpdump/' \
	 -e 's/mountpoint.1 wall.1/mountpoint.1/' src/Makefile
	make -C src
	make -C src install
	cp $(MY_ROOT)/etc/inittab /etc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
