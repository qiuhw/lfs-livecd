NAME = cdrtools
VER  = 3.00
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.bz2
URL-$(FILE) = http://ftp.gwdg.de/linux/cdrecord/$(FILE)
SUM-$(FILE) = f9fbab08fbd458b0d2312976d8c5f558

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	make INS_BASE=/tools DEFINSUSR=root DEFINSGRP=root
	make INS_BASE=/tools DEFINSUSR=root DEFINSGRP=root install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean
