NAME = coreutils
VER  = 8.21
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 065ba41828644eca5dd8163446de5d64

PATCH = $(DIR)-i18n-1.patch
URL-$(PATCH) = http://www.linuxfromscratch.org/patches/lfs/development/$(PATCH)
SUM-$(PATCH) = ada0ea6e1c00c4b7e0d634f49827943e

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)
	
compile-stage1:
	./configure --prefix=/tools --enable-install-program=hostname
	make
	make install

stage2: $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr \
	   --libexecdir=/usr/lib \
	   --enable-no-install-program=kill,uptime
	make
	make install
	mv /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
	mv /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,readlink,rm} /bin
	mv /usr/bin/{rmdir,stty,sync,true,uname,test,[} /bin
	mv /usr/bin/chroot /usr/sbin
	mv /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
	sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8
	mv /usr/bin/{head,sleep,nice} /bin

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 compile-stage2 clean
