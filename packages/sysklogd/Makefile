# Sysklogd Makefile

NM= sysklogd
VRS= 1.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 070cce745b023f2ce7ca7d9888af434d6d61c236

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make
	make BINDIR=/sbin install
	install -m644 $(MY_ROOT)/etc/syslog.conf /etc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
