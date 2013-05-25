# Baekmuk fonts Makefile

NAME= baekmuk-ttf
VRS= 2.2
DIR= $(NAME)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://kldp.net/frs/download.php/1429/baekmuk-ttf-2.2.tar.gz
SHA-$(FILE)= afdee34f700007de6ea87b43c92a88b7385ba65b

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) 
	$(std_build)

compile-stage2:
	cp -v ttf/*.ttf /usr/share/fonts

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
