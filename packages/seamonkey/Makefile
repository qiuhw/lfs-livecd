# Seamonkey Makefile

NM= seamonkey
VRS= 2.0.4
DIR= comm-1.9.1

FILE= $(NM)-$(VRS).source.tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 8bbf46520725b3fae0d057821a4e7cd89baa8031

MFH=/usr/lib/seamonkey

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/-$$(MOZ_APP_VERSION)//' config/autoconf.mk.in
	sed 's:@TOPSRCDIR@:$(MY_ROOT)/packages/$(NM)/$(DIR):' ../.mozconfig \
	 > .mozconfig
	make -f client.mk build
	make -f client.mk install
	rm -rf /root/.mozilla
	cp -a $(MY_ROOT)/root/.mozilla /root/.mozilla
	for dir in $$(find /root/.mozilla -name ".svn") ; do rm -rf $$dir ; done
	ln -sf seamonkey /usr/bin/mozilla

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
