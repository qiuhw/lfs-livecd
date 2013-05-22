# DocBook XSL Stylesheets Makefile

NM= docbook-xsl
VRS= 1.75.2
OLDVERSIONS= 1.69.1 1.67.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= cd146012c07f3c2c79c1cd927ad1faf5bee6cc74

FILE1= $(NM)-doc-$(VRS).tar.bz2
URL-$(FILE1)= $(HTTP)/$(NM)/$(FILE1)
SHA-$(FILE1)= 2befba14b0cfe748dec4bc8b7b891cbb2f394767

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE1) install
	chmod 755 install
	$(std_build)

compile-stage2:
	tar --strip-components=1 -xvf ../$(FILE1)
	../install $(VRS) $(OLDVERSIONS)
	ln -sf xsl-stylesheets-$(VRS) /usr/share/xml/docbook/xsl-stylesheets-current

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
