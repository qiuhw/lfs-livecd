# ntfsprogs Makefile

NAME= ntfsprogs
VER= 2.0.0
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://sourceforge.net/projects/linux-ntfs/files/NTFS%20Tools%20and%20Library/2.0.0/ntfsprogs-2.0.0.tar.gz
SUM-$(FILE)= c433189eb0955beb7360c6a475cc97083c5cd020

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
