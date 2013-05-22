# ppp Makefile

NM= ppp
VRS= 2.4.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= cb977b31584e3488e08a643aaa672fdb229d2e78

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install
	rm -rf /etc/ppp
	cp -a $(MY_ROOT)/etc/ppp/ /etc/ppp
	for dir in $$(find /etc/ppc -name ".svn") ; do rm -rvf $$dir ; done
	chown -R 0:0 /etc/ppp
	chmod 600 /etc/ppp/pap-secrets

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
