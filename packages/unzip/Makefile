# UnZip Makefile

NAME= unzip
VRS= 60
DIR= $(NAME)$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://prdownloads.sourceforge.net/infozip/$(FILE)
SHA-$(FILE)= abf7de8a4018a983590ed6f5cbd990d4740f8a22

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
ifeq ($(CD_ARCH),x86)
	make -f unix/Makefile LOCAL_UNZIP=-D_FILE_OFFSET_BITS=64 linux
else
	make -f unix/Makefile LOCAL_UNZIP=-D_FILE_OFFSET_BITS=64 linux_noasm
endif
	make prefix=/usr install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
