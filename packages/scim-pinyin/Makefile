# SCIM-pinyin Makefile

NAME= scim-pinyin
VER= 0.5.91
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/scim/files/scim-pinyin/0.5.91/scim-pinyin-0.5.91.tar.gz
SUM-$(FILE)= 58bea437a211b7af8420057541a38933a41841c7

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	$(shell sed -i 's/^.*<scim.h>/#include <cstring>\n#include <memory>\n&/' src/scim_pinyin.cpp) 
	$(shell sed -i 's/^.*<scim.h>/#include <cstring>\n&/' src/scim_phrase.cpp src/scim_pinyin_phrase.cpp src/scim_special_table.cpp)
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
