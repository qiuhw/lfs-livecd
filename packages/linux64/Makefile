# Linux Kernel Makefile

ifeq ($(CD_ARCH),x86)
CROSS_MAKE= PATH=$$PATH:$(WD)/bin make ARCH=x86_64 CROSS_COMPILE=x86_64-unknown-linux-gnu-
endif
ifeq ($(CD_ARCH),x86_64)
CROSS_MAKE= make
endif

NM= linux
VRS= 2.6.22.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.kernel.org/pub/linux/kernel/v2.6/$(FILE)
SHA-$(FILE)= a04e4efb32884ab95fe0ec38d60552cf3e0c49b8

PATCH1= reiser4-for-2.6.22-2.patch.gz
URL-$(PATCH1)= ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.22/$(PATCH1)
SHA-$(PATCH1)= a49f8a6d9851915c31f4c44e00519e0e4d2461c7

# Undoes some upstream changes that are needed for linux-2.6.23-rcX
# but break the build with 2.6.22
PATCH2= rt2x00-fixes-1.patch

PATCH3= tulip-is-not-a-proper-driver-for-dm910x.patch

FILE1= ati-driver-installer-8.38.6-x86.x86_64.run
URL-$(FILE1)= http://www2.ati.com/drivers/linux/$(FILE1)
SHA-$(FILE1)= a4320c6d3c6716740971c18bbd5e62b0b452cc67

DIR2= NVIDIA-Linux-x86_64-100.14.11-pkg0
FILE2= $(DIR2).run
URL-$(FILE2)= http://us.download.nvidia.com/XFree86/Linux-x86_64/100.14.11/$(FILE2)
SHA-$(FILE2)= 11c4f7ab736262e20db937ec410de3511e3e6aad

DIR3= NVIDIA-Linux-x86_64-1.0-9639-pkg0
FILE3= $(DIR3).run
URL-$(FILE3)= http://us.download.nvidia.com/XFree86/Linux-x86_64/1.0-9639/$(FILE3)
SHA-$(FILE3)= 6294d421131b9dc4514634ecde171869f589dae3

DIR4= NVIDIA-Linux-x86_64-1.0-7185-pkg0
FILE4= $(DIR4).run
URL-$(FILE4)= http://us.download.nvidia.com/XFree86/Linux-x86_64/1.0-7185/$(FILE4)
SHA-$(FILE4)= ffe1eb012707d5bffbe39756be54cb687b4ef498

DIR5= mac80211-9.0.4
FILE5= $(DIR5).tgz
URL-$(FILE5)= http://intellinuxwireless.org/mac80211/downloads/$(FILE5)
SHA-$(FILE5)= c15acff74a7c736cdb997546083f1e34278c6387

DIR6= iwlwifi-1.0.0-1
FILE6= $(DIR6).tgz
URL-$(FILE6)= http://intellinuxwireless.org/iwlwifi/downloads/$(FILE6)
SHA-$(FILE6)= 879a636b63cd1c8aebc8bc1a6205656b491107bb

DIR7= rt2x00-cvs-2007081406
FILE7= $(DIR7).tar.gz
# Originally from http://rt2x00.serialmonkey.com/rt2x00-cvs-daily.tar.gz
URL-$(FILE7)= http://www.linuxfromscratch.org/~alexander/$(FILE7)
SHA-$(FILE7)= 3eba4dc8e08ce256280adff492b541bda9c0198b

# The latest version from
# http://ftp.kernel.org/pub/linux/kernel/people/linville/wireless-2.6/ath5k/
# does not compile against linux-2.6.22. So here is an old SVN snapshot
# from http://madwifi.org/

DIR8= ath5k-r2701
FILE8= $(DIR8).tar.gz
URL-$(FILE8)= http://www.linuxfromscratch.org/~alexander/$(FILE8)
SHA-$(FILE8)= d14a002ba192788881ca9a715348f8b7b898fe3c

DIR9=rtl-mac80211-20070729
FILE9= $(DIR9).tar.bz2
URL-$(FILE9)= http://www.hauke-m.de/fileadmin/rtl-wifi/$(FILE9)
SHA-$(FILE9)= 001787fe6556cdfe02ec77665e83f7747d71b953

# Git snapshot - stable versions are incompatible with linux-2.6.22
DIR10= speakup-20070928
FILE10= $(DIR10).tar.gz
URL-$(FILE10)= http://www.linuxfromscratch.org/~alexander/$(FILE10)
SHA-$(FILE10)= 101a7fcae2cbf2dbad81d91ff7cb262d6857d104

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM)64 $(chbash-post-bash)'

stage2: Makefile $(FILE) $(FILE1) $(FILE2) $(FILE3) $(FILE4) $(FILE5) $(FILE6) $(FILE7) $(FILE8) $(FILE9) $(FILE10) $(PATCH1)
	$(std_build)

compile-stage2:
	tar xf ../$(FILE5) ; cd $(DIR5) ; make KSRC=.. patch_kernel
	tar xf ../$(FILE6) ; cd $(DIR6) ; echo "Y" | make KSRC=.. patch_kernel
	tar xf ../$(FILE10) ; cd $(DIR10) ; ./install-spkglue `pwd`/.. ; ./install-speakup `pwd`/..
	zcat ../$(PATCH1) | patch -Np1
	patch -Np1 -i ../$(PATCH3)
	install -d /boot/isolinux
	make mrproper
	cp ../config.x86_64 .config
	# Hack for fglrx
	touch include/linux/ioctl32.h
	$(CROSS_MAKE)
	$(CROSS_MAKE) modules_install
	cp -v arch/x86_64/boot/bzImage /boot/isolinux/linux64
	create-initramfs $(CD_VERSION) $(VRS)-64bit /boot/isolinux/initramfs_data64.cpio.gz
	sed 's/VERSION/$(VRS)/' ../fakes-for-fglrx/uname.in >../fakes-for-fglrx/uname
	sed 's/VERSION/$(VRS)/' ../fakes-for-fglrx/cat.in >../fakes-for-fglrx/cat
	chmod 755 ../fakes-for-fglrx/{uname,cat}
ifeq ($(CD_ARCH),x86)
	PATH=$$PWD/../fakes-for-fglrx:$$PATH sh ../$(FILE1) --buildpkg Slackware/Only_Module
	for a in $(DIR2) $(DIR3) $(DIR4) ; do \
	    sh ../$$a.run -x ; ../build-nvidia-driver $$a $(VRS)-64bit ; done
endif
ifeq ($(CD_ARCH),x86_64)
	PATH=$$PWD/../fakes-for-fglrx:$$PATH sh ../$(FILE1) --buildpkg Slackware/All
	for a in $(DIR2) $(DIR3) $(DIR4) ; do \
	    sh ../$$a.run -x ; ../build-nvidia-driver.native $$a $(VRS)-64bit ; done
endif
	# both rtl8187 and rt2x00 build eeprom_93cx6.ko and thus conflict
	# so we have to hack the build
	tar xf ../$(FILE7) ; tar xf ../$(FILE9) ; cd $(DIR7) ; \
	    cp ../../config.rt2x00 config ; cp ../$(DIR9)/rtl* . ; \
	    sed -i 's@"eeprom_93cx6.h"@<linux/eeprom_93cx6.h>@' rtl8187_dev.c ; \
	    sed -i '/depmod/d' Makefile ; \
	    echo "obj-m += rtl8187.o" >>Makefile ; \
	    echo "rtl8187-objs := rtl8187_dev.o rtl8187_rtl8225.o" >>Makefile ; \
	    patch -Np0 -i ../../$(PATCH2) ; \
	    $(CROSS_MAKE) KERNDIR=`pwd`/.. ; \
	    $(CROSS_MAKE) KERNDIR=`pwd`/.. install
	tar xf ../$(FILE8) ; cd $(DIR8) ; \
	    make KDIR=`pwd`/.. ; make KDIR=`pwd`/.. install
ifeq ($(CD_ARCH),x86)
	rm /lib/modules/*-64bit/{source,build}
endif
ifeq ($(CD_ARCH),x86_64)
	rm -rf $(DIR2) $(DIR3) $(DIR4) $(DIR5) $(DIR6) $(DIR7) $(DIR8) $(DIR9) $(DIR10)
	../debian-style-headers.sh
endif
	mv *.tgz /drivers

clean:
	-rm -rf $(DIR)
	-rm -f fakes-for-fglrx/{uname,cat}

.PHONY: clean chroot compile-stage2
