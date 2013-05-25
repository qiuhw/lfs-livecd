# Coreutils Makefile

NAME= coreutils
VER= 8.4
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/coreutils/coreutils-8.4.tar.gz
SUM-$(FILE)= 89eefb041215c30408261f46f59dc08e4b500edf

PATCH1= $(DIR)-uname-1.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/lfs/6.6/coreutils-8.4-uname-1.patch
SUM-$(PATCH1)= 366cc6a73a0f9c27d33e96983df39c1ed631b764

PATCH2= $(DIR)-i18n-1.patch
URL-$(PATCH2)= http://www.linuxfromscratch.org/patches/lfs/6.6/coreutils-8.4-i18n-1.patch
SUM-$(PATCH2)= 36ce7ce492b5873044e0576e69616ecc676f1bf4

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE)
	$(std_build)
	
compile-prebuild:
	./configure --prefix=/tools
	make -C lib
	make -C src version.h su
	install -m755 src/su /tools/bin/

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=/tools \
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
	/tools/bin/mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
	/tools/bin/mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,readlink,rm} /bin
	mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
	mv -v /usr/bin/chroot /usr/sbin
	mv -v /usr/bin/{head,sleep,nice} /bin
	cp -v src/su /bin

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
