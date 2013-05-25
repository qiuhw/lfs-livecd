# DocBook XML DTD Makefile

NAME= docbook-xml
VER= 4.5
OLDVERSIONS= 4.1.2 4.2 4.3 4.4
DIR= $(NAME)-$(VER)

FILE= $(DIR).zip
URL-$(FILE)= http://www.docbook.org/xml/4.5/docbook-xml-4.5.zip
SUM-$(FILE)= b9124233b50668fb508773aa2b3ebc631d7c1620

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
	../install $(VER) $(OLDVERSIONS)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
