# Thai fonts Makefile

NAME= thai-ttf
VER= 0.4.5
DIR= usr
LOCATION= /usr/share/fonts

FILE= $(NAME)-$(VER).tar.gz
URL-$(FILE)= http://linux.thai.net/pub/thailinux/software/thai-ttf/$(FILE)
SUM-$(FILE)= 02e94e471b2b29845f4dbbde6056b34fac0d1611

# Targets

include $(ROOT)/scripts/functions

stage2: Makefile $(FILE) 
	$(std_build)

compile-stage2:
	cp -v share/fonts/th/TTF/*.ttf $(LOCATION)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
