# LFS Book Makefile

NM= LFS-BOOK
VRS= 6.6
DIRBASE= $(NM)-$(VRS)
DIR= $(DIRBASE)-XML
HTMLDIR= $(DIRBASE)-HTML

URL= svn://svn.linuxfromscratch.org/LFS/tags/6.6/BOOK

SEAMONKEY_CONFIG= $(MY_ROOT)/root/.mozilla/default/79exklwh.slt/prefs.js

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	@$(call echo_message, Building)
	@mkdir tmp
	@make CROSSVARS=../$(CROSSVARS) -C tmp -f ../Makefile compile-$@ \
	  2>&1 | tee -a $(MY_ROOT)/logs/build.log >$(DIR)-$@.log
	@make clean 2>&1 | tee -a $(MY_ROOT)/logs/build.log >>$(DIR)-$@.log
	@touch $@

compile-stage2:
	svn export $(URL) $(DIR)
	cd $(DIR) ; make BASEDIR=../$(HTMLDIR) RENDERTMP=.
	rm $(DIR)/lfs-full.xml $(DIR)/lfs-html.xml
	cp -av $(DIR) $(HTMLDIR) /usr/share
	cd $(SRC) ; cp -v `sed 's@^.*/\([^/]*\)$$@\1@' /usr/share/$(HTMLDIR)/wget-list` $(LFSSRC)
	sed -i \
	 's@file:///.*index.html@file:///usr/share/$(HTMLDIR)/index.html@' \
	 $(SEAMONKEY_CONFIG)
	sed -i 's@WWW_HOME=\".*\"@WWW_HOME=\"/usr/share/$(HTMLDIR)/index.html\"@' \
	 $(MY_ROOT)/etc/profile

clean:
	-rm -rf tmp
	-rm -rf $(ROOT)/root/tmp

.PHONY: clean compile-stage2
