# Coreutils Makefile

NM= coreutils
VRS= 8.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 89eefb041215c30408261f46f59dc08e4b500edf

PATCH1= $(DIR)-uname-1.patch
URL-$(PATCH1)= $(HTTP)/$(NM)/$(PATCH1)
SHA-$(PATCH1)= 366cc6a73a0f9c27d33e96983df39c1ed631b764

PATCH2= $(DIR)-i18n-1.patch
URL-$(PATCH2)= $(HTTP)/$(NM)/$(PATCH2)
SHA-$(PATCH2)= 36ce7ce492b5873044e0576e69616ecc676f1bf4

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE)
	$(std_build)
	
compile-prebuild:
	./configure --prefix=$(TT)
	make -C lib
	make -C src version.h su
	install -m755 src/su $(TT)/bin/

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT) \
		--enable-install-program=hostname
	make
	make install

stage2: Makefile $(FILE) $(PATCH1) $(PATCH2)
	$(std_build)

compile-stage2:
	case $(MY_ARCH) in *86*) patch -Np1 -i ../$(PATCH1) ;; esac
	patch -Np1 -i ../$(PATCH2)
	./configure \
		--prefix=/usr \
		--enable-no-install-program=kill,uptime
	make
	make install
	$(TT)/bin/mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
	$(TT)/bin/mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,readlink,rm} /bin
	mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
	mv -v /usr/bin/chroot /usr/sbin
	mv -v /usr/bin/{head,sleep,nice} /bin
	cp -v src/su /bin

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2