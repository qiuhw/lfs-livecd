# Markdown Makefile

NM= Markdown
VRS= 1.0.1
DIR= $(NM)_$(VRS)

FILE= $(DIR).zip
URL-$(FILE)= http://daringfireball.net/projects/downloads/$(FILE)
SHA-$(FILE)= 7e6d1d9224f16fec5631bf6bc5147f1e64715a4b

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	unzip $(FILE)
	# We want to run this outside of the chroot
	sed -i 's/usr/tools/' $(DIR)/Markdown.pl
	install -m755 $(DIR)/Markdown.pl /tools/bin/Markdown
	make clean
	@touch $@

clean:
	-rm -rf $(DIR)

.PHONY: clean
