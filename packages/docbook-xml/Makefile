# DocBook XML DTD Makefile

NM= docbook-xml
VRS= 4.5
OLDVERSIONS= 4.1.2 4.2 4.3 4.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).zip
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= b9124233b50668fb508773aa2b3ebc631d7c1620

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) install
	@mkdir $(DIR)
	@chmod 755 install
	@cd $(DIR) ; unzip ../$(FILE)
	@make -C $(DIR) -f ../Makefile compile-$@
	@make clean
	@touch $@

compile-stage2:
	../install $(VRS) $(OLDVERSIONS)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
