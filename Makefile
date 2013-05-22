#
# Makefiles for automating the LFS LiveCD build
#
# Written by Jeremy Huntwork | jhuntwork AT linuxfromscratch DOT org
# Several additions and edits by Alexander Patrakov, Justin Knierim and
# Thomas Pegg
#
# These scripts are published under the GNU General Public License, version 2
#
#==============================================================================

# Place your personal customizations in Makefile.personal
# instead of editing this Makefile.
# Makefile.personal is deliberately not in SVN.

-include Makefile.personal

#==============================================================================
# Variables you may want to change.
#==============================================================================

# Timezone
export timezone ?= America/New_York

# Remote server location for packages
export HTTP ?= http://dev.lightcube.us/~jhuntwork/sources

# Default paper size for groff.
export pagesize ?= letter

#==============================================================================
# The following variables are not expected to be changed, but could be, if you
# understand how they are used and accept the consequences of changing them.
#==============================================================================

# Location for the temporary tools, must be a directory immediately under /
export TT := /tools

# Location for the sources, must be a directory immediately under /
export SRC := /sources

# The name of the build user account to create and use for the temporary tools
export USER := builduser

# Compiler optimizations
export CFLAGS := -O2 -pipe
export CXXFLAGS := $(CFLAGS)
export LDFLAGS := -s

# Set the base architecture
# Currently supported: i686
# FIXME: Verify that the host is one of the above
export MY_ARCH := $(shell uname -m)
export LINKER = ld-linux.so.2

# The full path to the build scripts on the host OS
# e.g., /mnt/build/build-env
export MY_BASE := $(shell pwd)

# The path to the build directory - This must be the parent directory of $(MY_BUILD)
# e.g., /mnt/build
export MY_BUILD := $(shell dirname $(MY_BASE))

# The chroot form of $(MY_BASE), needed so that certain functions and scripts will
# work both inside and outside of the chroot environment.
# e.g., /build-env
export MY_ROOT := /$(shell basename $(MY_BASE))

# Free disk space needed for the build.
ROOTFS_MEGS := 1536

# LiveCD version
export CD_VERSION ?= $(MY_ARCH)-6.6

#==============================================================================
# The following variables are not expected to be changed
#==============================================================================

export MP := $(MY_BUILD)/image
export MKTREE := $(MP)$(MY_ROOT)
export LFSSRC := /lfs-sources

#==============================================================================
# Environment Variables - don't modify these!
#==============================================================================

export toolsenv := env -i HOME=/home/$(USER) LC_ALL=POSIX PATH=$(TT)/bin:/bin:/usr/bin /bin/bash -c
export toolsbash := set +o hashall 2>/dev/null || set -o nohash && umask 022 && cd $(MY_ROOT)

export chenv-pre-bash := $(TT)/bin/env -i HOME=/root TERM=$(TERM) PS1='\u:\w\$$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin:$(TT)/bin $(TT)/bin/bash -c
export chenv-post-bash := $(TT)/bin/env -i HOME=/root TERM=$(TERM) PS1='\u:\w\$$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin:$(TT)/bin /bin/bash -c

export WGET := $(TT)/bin/wget

export BRW = "[0;1m"
export RED = "[0;31m"
export GREEN = "[0;32m"
export ORANGE = "[0;33m"
export BLUE = "[0;44m"
export WHITE = "[00m"

# Architecture specifics
ifeq ($(MY_ARCH),ppc)
export MY_LIBDIR := lib
export BUILD_ARCH := powerpc-custom-linux-gnu
else
export BUILD_ARCH := $(MY_ARCH)-custom-linux-gnu
endif

#==============================================================================
# Build Targets
#==============================================================================

all: test-host base iso
	@echo $(GREEN)"The LiveCD, $(MY_BUILD)$(MY_ROOT)/lfslivecd-$(CD_VERSION).iso, is ready!"$(WHITE)

# Check host prerequisites
# FIXME: Fill this out with more package pre-reqs
test-host:
	@if [ $$EUID -ne 0 ] ; then \
	 echo "You must be logged in as root." && exit 1 ; fi
	@if ! type -p gawk >/dev/null 2>&1 ; then \
	 echo -e "Missing gawk on host!\nPlease install gawk and re-run 'make'." && exit 1 ; fi 

base: $(MKTREE) builduser build-tools
	@chroot "$(MP)" $(chenv-pre-bash) 'set +h && \
	 chown -R 0:0 $(TT) $(SRC) $(MY_ROOT) && \
	 cd $(MY_ROOT) && make SHELL=$(TT)/bin/bash pre-bash'
	@chroot "$(MP)" $(chenv-post-bash) 'set +h && cd $(MY_ROOT) && \
	 make SHELL=/bin/bash post-bash'
	@install -m644 etc/issue* $(MP)/etc
	@touch $@

# This target populates the root.ext2 image and sets up some mounts
$(MKTREE): root.ext2
	mkdir -p $(MP) $(MY_BUILD)$(SRC) $(MY_BUILD)$(TT)/bin $(MY_BUILD)/iso/boot
	mount -o loop root.ext2 $(MP)
	mkdir -p $(MKTREE) $(MP)$(SRC) $(MP)$(TT)
	mkdir -p $(MP)/boot $(MP)$(LFSSRC) $(MY_BUILD)/iso$(LFSSRC)
	mount --bind $(MY_BASE) $(MP)$(MY_ROOT)
	mount --bind $(MY_BUILD)$(TT) $(MP)$(TT)
	mount --bind $(MY_BUILD)$(SRC) $(MP)$(SRC)
	mount --bind $(MY_BUILD)/iso/boot $(MP)/boot
	mount --bind $(MY_BUILD)/iso$(LFSSRC) $(MP)$(LFSSRC)
	-ln -nsf $(MY_BUILD)$(TT) /
	-install -dv $(TT)/bin
	-ln -sv /bin/bash $(TT)/bin/sh
	-ln -nsf $(MY_BUILD)$(SRC) /
	-ln -nsf $(MY_BUILD)$(MY_ROOT) /
	-mkdir -p $(MP)/{proc,sys,dev/shm,dev/pts}
	-mount -t proc proc $(MP)/proc
	-mount -t sysfs sysfs $(MP)/sys
	-mount -t tmpfs shm $(MP)/dev/shm
	-mount -t devpts devpts $(MP)/dev/pts
	-mkdir -pv $(MP)/{bin,boot,etc,home,lib,mnt,opt}
	-mkdir -pv $(MP)/{media/{floppy,cdrom},sbin,srv,var}
	-install -dv $(TT)/bin
	-install -m755 $(MY_BASE)/scripts/unpack $(TT)/bin
	-install -d -m 0750 $(MP)/root
	-install -d -m 1777 $(MP)/tmp $(MP)/var/tmp
	-mkdir -pv $(MP)/usr/{,local/}{bin,include,lib,sbin,src}
	-mkdir -pv $(MP)/usr/{,local/}share/{doc,info,locale,man}
	-mkdir -v  $(MP)/usr/{,local/}share/{misc,terminfo,zoneinfo}
	-mkdir -pv $(MP)/usr/{,local/}share/man/man{1..8}
	-for dir in $(MP)/usr $(MP)/usr/local; do ln -sv share/{man,doc,info} $$dir ; done
	-mkdir -v $(MP)/var/{lock,log,mail,run,spool}
	-mkdir -pv $(MP)/var/{opt,cache,lib/{misc,locate},local}
	-mknod -m 600 $(MP)/dev/console c 5 1
	-mknod -m 666 $(MP)/dev/null c 1 3
	-mknod -m 666 $(MP)/dev/zero c 1 5
	-mknod -m 666 $(MP)/dev/ptmx c 5 2
	-mknod -m 666 $(MP)/dev/tty c 5 0
	-mknod -m 444 $(MP)/dev/random c 1 8
	-mknod -m 444 $(MP)/dev/urandom c 1 9
	-ln -s /proc/self/fd $(MP)/dev/fd
	-ln -s /proc/self/fd/0 $(MP)/dev/stdin
	-ln -s /proc/self/fd/1 $(MP)/dev/stdout
	-ln -s /proc/self/fd/2 $(MP)/dev/stderr
	-ln -s /proc/kcore $(MP)/dev/core
	-install -dv $(MY_BASE)/logs
	touch $(MKTREE)

# This image should be kept as clean as possible, i.e.:
# avoid creating files on it that you will later delete,
# preserve as many zeroed sectors as possible.
root.ext2:
	dd if=/dev/null of=root.ext2 bs=1M seek=$(ROOTFS_MEGS)
	mke2fs -F root.ext2
	tune2fs -c 0 -i 0 root.ext2

# Add the unprivileged user - will be used for building the temporary tools
builduser:
	@-groupadd $(USER)
	@-useradd -s /bin/bash -g $(USER) -m -k /dev/null $(USER)
	@-chown -R $(USER):$(USER) $(MY_BUILD)$(TT) $(MY_BUILD)$(SRC) $(MY_BASE)
	@touch $@

build-tools:
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make bash-prebuild'"
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make SHELL=$(TT)/bin/sh wget-prebuild'"
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make SHELL=$(TT)/bin/sh coreutils-prebuild'"
	@$(TT)/bin/su - $(USER) -c "$(toolsenv) '$(toolsbash) && make SHELL=$(TT)/bin/sh tools'"
	@cp /etc/resolv.conf $(TT)/etc
	@rm -rf $(TT)/{,share/}{info,man}
	@-ln -s $(TT)/bin/bash $(MP)/bin/bash
	@install -m644 -oroot -groot $(MY_BASE)/etc/{group,passwd} $(MP)/etc
	@touch $@

maybe-tools:
	@if [ -f tools.tar.bz2 ] ; then \
	    echo "Found previously built tools. Unpacking..." && \
	    tar -C .. -jxpf tools.tar.bz2 ; \
	else \
	    su - lfs -c "$(lfsenv) '$(lfsbash) && $(MAKE) tools'" && \
	    echo "Packaging tools for later use..." && \
	    tar -C .. -jcpf tools.tar.bz2 tools ; \
	fi
	@touch $@

tools: \
	make-prebuild \
	sed-prebuild \
	binutils-prebuild \
	gcc-prebuild \
	linux-headers-stage1 \
	glibc-stage1 \
	binutils-stage1 \
	gcc-stage1 \
	tcl-stage1 \
	expect-stage1 \
	dejagnu-stage1 \
	ncurses-stage1 \
	bash-stage1 \
	bzip2-stage1 \
	coreutils-stage1 \
	diffutils-stage1 \
	findutils-stage1 \
	gawk-stage1 \
	gettext-stage1 \
	grep-stage1 \
	gzip-stage1 \
	m4-stage1 \
	make-stage1 \
	patch-stage1 \
	perl-stage1 \
	sed-stage1 \
	tar-stage1 \
	texinfo-stage1 \
	wget-stage1 \
	zlib-stage1 \
	cdrtools-stage1
	
pre-bash: \
	createfiles \
	linux-headers-stage2 \
	man-pages-stage2 \
	glibc-stage2 \
	zlib-stage2 \
	binutils-stage2 \
	gmp-stage2 \
	mpfr-stage2 \
	file-stage2 \
	gcc-stage2 \
	sed-stage2 \
	pkg-config-stage2 \
	ncurses-stage2 \
	util-linux-ng-stage2 \
	e2fsprogs-stage2 \
	coreutils-stage2 \
	iana-etc-stage2 \
	m4-stage2 \
	bison-stage2 \
	procps-stage2 \
	grep-stage2 \
	readline-stage2 \
	bash-stage2

createfiles:
	@-$(TT)/bin/ln -s $(TT)/bin/{bash,cat,grep,pwd,stty} /bin
	@-$(TT)/bin/ln -s $(TT)/bin/perl /usr/bin
	@-$(TT)/bin/ln -s $(TT)/lib/libgcc_s.so{,.1} /usr/lib
	@-$(TT)/bin/ln -s $(TT)/lib/libstdc++.so{,.6} /usr/lib
	@-$(TT)/bin/ln -s bash /bin/sh
	@touch /var/run/utmp /var/log/{btmp,lastlog,wtmp}
	@chgrp utmp /var/run/utmp /var/log/lastlog
	@chmod 664 /var/run/utmp /var/log/lastlog
	@cp $(TT)/etc/resolv.conf /etc
	@-cp $(MY_ROOT)/etc/hosts /etc
	@touch $@

post-bash: \
	libtool-stage2 \
	gdbm-stage2 \
	inetutils-stage2 \
	perl-stage2 \
	autoconf-stage2 \
	automake-stage2 \
	bzip2-stage2 \
	diffutils-stage2 \
	gawk-stage2 \
	findutils-stage2 \
	flex-stage2 \
	gettext-stage2 \
	groff-stage2 \
	grub-stage2 \
	gzip-stage2 \
	iproute2-stage2 \
	kbd-stage2 \
	less-stage2 \
	make-stage2 \
	man-db-stage2 \
	module-init-tools-stage2 \
	patch-stage2 \
	psmisc-stage2 \
	shadow-stage2 \
	sysklogd-stage2 \
	sysvinit-stage2 \
	tar-stage2 \
	texinfo-stage2 \
	udev-stage2 \
	final-environment \
	openssl-stage2 \
	wget-stage2 \
	Python-stage2 \
	attr-stage2 \
	acl-stage2 \
	reiserfsprogs-stage2 \
	xfsprogs-stage2 \
	nano-stage2 \
	joe-stage2 \
	screen-stage2 \
	libidn-stage2 \
	libgpg-error-stage2 \
	libgcrypt-stage2 \
	gnutls-stage2 \
	curl-stage2 \
	zip-stage2 \
	unzip-stage2 \
	lynx-stage2 \
	libxml2-stage2 \
	expat-stage2 \
	subversion-stage2 \
	lfs-bootscripts-stage2 \
	livecd-bootscripts-stage2 \
	blfs-bootscripts-stage2 \
	docbook-xml-stage2 \
	libxslt-stage2 \
	docbook-xsl-stage2 \
	html_tidy-stage2 \
	LFS-BOOK-stage2 \
	openssh-stage2 \
	pcre-stage2 \
	glib2-stage2 \
	which-stage2 \
	pciutils-stage2 \
	libusb-stage2 \
	libusb-compat-stage2 \
	usbutils-stage2 \
	cvs-stage2 \
	popt-stage2 \
	samba-stage2 \
	LVM2-stage2 \
	parted-stage2 \
	irssi-stage2 \
	wireless_tools-stage2 \
	wpa_supplicant-stage2 \
	tcpwrappers-stage2 \
	portmap-stage2 \
	libtirpc-stage2 \
	libcap-stage2 \
	libnfsidmap-stage2 \
	libevent-stage2 \
	nfs-utils-stage2 \
	rsync-stage2 \
	jhalfs-stage2 \
	sudo-stage2 \
	bc-stage2 \
	dialog-stage2 \
	ncftp-stage2 \
	dmraid-stage2 \
	mdadm-stage2 \
	dhcpcd-stage2 \
	distcc-stage2 \
	ppp-stage2 \
	rp-pppoe-stage2 \
	pptp-stage2 \
	cpio-stage2 \
	mutt-stage2 \
	msmtp-stage2 \
	strace-stage2 \
	slang-stage2 \
	tin-stage2 \
	iptables-stage2 \
	eject-stage2 \
	hdparm-stage2 \
	mc-stage2 \
	fuse-stage2 \
	dosfstools-stage2 \
	ntfsprogs-stage2 \
	man-pages-fr-stage2 \
	man-pages-it-stage2 \
	man-pages-es-stage2 \
	manpages-de-stage2 \
	manpages-ru-stage2 \
	libpng-stage2 \
	freetype-stage2 \
	fontconfig-stage2 \
	Xorg-base-stage2 \
	Xorg-proto-stage2 \
	Xorg-util-stage2 \
	libXau-stage2 \
	libXdmcp-stage2 \
	xcb-proto-stage2 \
	libpthread-stubs-stage2 \
	libxcb-stage2 \
	ed-stage2 \
	Xorg-lib-stage2 \
	xbitmaps-stage2 \
	libdrm-stage2 \
	Mesa-stage2 \
	Xorg-app-stage2 \
	xcursor-themes-stage2 \
	Xorg-font-stage2 \
	XML-Parser-stage2 \
	intltool-stage2 \
	xkeyboard-config-stage2 \
	luit-stage2 \
	pixman-stage2 \
	dbus-stage2 \
	dbus-glib-stage2 \
	hal-stage2 \
	hal-info-stage2 \
	xorg-server-stage2 \
	Xorg-driver-stage2 \
	freefont-stage2 \
	fonts-dejavu-stage2 \
	fonts-kochi-stage2 \
	fonts-firefly-stage2 \
	fonts-baekmuk-stage2 \
	libjpeg-stage2 \
	libtiff-stage2 \
	giflib-stage2 \
	gc-stage2 \
	cairo-stage2 \
	hicolor-icon-theme-stage2 \
	pango-stage2 \
	atk-stage2 \
	jasper-stage2 \
	gtk2-stage2 \
	w3m-stage2 \
	libIDL-stage2 \
	alsa-lib-stage2 \
	alsa-utils-stage2 \
	alsa-firmware-stage2 \
	libogg-stage2 \
	libvorbis-stage2 \
	seamonkey-stage2 \
	speex-stage2 \
	flac-stage2 \
	libdvdcss-stage2 \
	libtheora-stage2 \
	xine-lib-stage2 \
	librsvg-stage2 \
	startup-notification-stage2 \
	vim-stage2 \
	vte-stage2 \
	URI-stage2 \
	ExtUtils-Depends-stage2 \
	ExtUtils-PkgConfig-stage2 \
	Glib-stage2 \
	libglade-stage2 \
	libwnck-stage2 \
	gstreamer-stage2 \
	liboil-stage2 \
	gstreamer-plugins-base-stage2 \
	xfce-stage2 \
	pidgin-stage2 \
	xchat-stage2 \
	xlockmore-stage2 \
	linux32-stage2 \
	initramfs-stage2 \
	sysfsutils-stage2 \
	pcmciautils-stage2 \
	ddccontrol-stage2 \
	ddccontrol-db-stage2 \
	syslinux-stage2 \
	dotconf-stage2 \
	portaudio-stage2 \
	espeak-stage2 \
	speech-dispatcher-stage2 \
	speechd-up-stage2 \
	brltty-stage2 \
	anthy-stage2 \
	scim-stage2 \
	scim-tables-stage2 \
	scim-anthy-stage2 \
	libhangul-stage2 \
	scim-hangul-stage2 \
	libchewing-stage2 \
	scim-chewing-stage2 \
	scim-pinyin-stage2 \
	scim-input-pad-stage2 \
	hibernate-script-stage2 \
	xz-stage2 \
	libx86-stage2 \
	vbetool-stage2 \
	gcc33-stage2 \
	linux-stage2 \
	binutils-stage3 \
	gcc-stage3 \
	linux-stage3 \
	zisofs-tools-stage2 \
	update-caches

final-environment:
	@cp -a $(MY_ROOT)/etc/sysconfig /etc
	@rm -rf /etc/sysconfig/.svn
	@-cp $(MY_ROOT)/etc/inputrc /etc
	@-cp $(MY_ROOT)/etc/bashrc /etc
	@-cp $(MY_ROOT)/etc/profile /etc
	@-dircolors -p > /etc/dircolors
	@-cp $(MY_ROOT)/etc/fstab /etc

wget-list:
	@>wget-list ; \
	 for DIR in packages/* ; do \
	    make -C $${DIR} wget-list-entry || echo Never mind. ; \
	 done ; \
	 sed -i '/^$$/d' wget-list

stop:
	@echo $(GREEN)Stopping due to user specified stop point.$(WHITE)
	@exit 1

#==============================================================================
# Targets for building packages individually. Useful for troubleshooting.
# These are not used internally, but are expected to be specified manually on
# the command line, i.e., 'make [target]'
#==============================================================================

%-only-prebuild: builduser
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make $*-prebuild'"

%-only-stage1: builduser
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make $*-stage1'"

%-only-stage2: $(MKTREE)
	@chroot "$(MP)" $(chenv-post-bash) 'set +h && cd $(MY_ROOT) && \
	 make SHELL=/bin/bash -C packages/$* stage2'

# Clean the build directory of a single package.
%-clean:
	make -C packages/$* clean

#==============================================================================
# Do not call the targets below manually!
# These are used internally and must be called by other targets.
#==============================================================================

%-prebuild: %-clean
	make -C packages/$* prebuild

%-stage1: %-clean
	make -C packages/$* stage1

%-stage2: %-clean
	make -C packages/$* stage2

%-stage3: %-clean
	make -C packages/$* stage3

update-caches:
	cd /usr/share/fonts ; mkfontscale ; mkfontdir ; fc-cache -f
	mandb -c 2>/dev/null
	echo 'dummy / ext2 defaults 0 0' >/etc/mtab
	updatedb --prunepaths='/sources /tools /lfs-livecd /lfs-sources /proc /sys /dev /tmp /var/tmp'
	echo >/etc/mtab
	
#==============================================================================
# Targets to create the iso
#==============================================================================

prepiso: $(MKTREE)
	@-rm $(MP)/root/.bash_history
	@-rm $(MP)/etc/resolv.conf
	@>$(MP)/var/log/btmp
	@>$(MP)/var/log/wtmp
	@>$(MP)/var/log/lastlog
	@sed -i 's/Version:$$/Version: $(CD_VERSION)/' $(MP)/boot/isolinux/boot.msg
	@sed -i 's/Version:$$/Version: $(CD_VERSION)/' $(MP)/etc/issue*
	@install -m644 doc/lfscd-remastering-howto.txt $(MP)/root
	@sed -e 's/\[Version\]/$(CD_VERSION)/' -e 's/\\_/_/g' \
	    doc/README.txt >$(MP)/root/README.txt
	@install -m600 root/.bashrc $(MP)/root/.bashrc
	@install -m755 scripts/{net-setup,greeting,livecd-login} $(MP)/usr/bin/ 
	@sed s/@LINKER@/$(LINKER)/ scripts/shutdown-helper.in >$(MP)/usr/bin/shutdown-helper
	@chmod 755 $(MP)/usr/bin/shutdown-helper
	#@svn export --force root $(MP)/etc/skel

iso: prepiso
	@make unmount
	# Bug in old kernels requires a sync after unmounting the loop device
	# for data integrity.
	@sync ; sleep 1 ; sync
	# e2fsck optimizes directories and returns 1 after a clean build.
	# This is not a bug.
	@-e2fsck -f -p root.ext2
	@$(TT)/bin/mkzftree -F root.ext2 $(MY_BUILD)/iso/root.ext2
	@cd $(MY_BUILD)/iso ; $(TT)/bin/mkisofs -z -R -l --allow-leading-dots -D -o \
	$(MY_BUILD)$(MY_ROOT)/lfslivecd-$(CD_VERSION).iso -b boot/isolinux/isolinux.bin \
	-c boot/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table \
	-V "lfslivecd-$(CD_VERSION)" ./
	@cd $(MY_BUILD)/iso ; $(TT)/bin/mkisofs -z -R -l --allow-leading-dots -D -o \
	$(MY_BUILD)$(MY_ROOT)/lfslivecd-$(CD_VERSION)-nosrc.iso -b boot/isolinux/isolinux.bin \
	-c boot/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table \
	-m lfs-sources -V "lfslivecd-$(CD_VERSION)" ./

#==============================================================================
# Targets to clean the tree.
# 'clean' cleans the build system tree, scrub also cleans the installed system
#==============================================================================

clean: unmount
	@-rm -rf $(TT) $(MY_BUILD)$(TT) $(MY_BUILD)/iso
	@-userdel $(USER)
	@-groupdel $(USER)
	@rm -rf /home/$(USER)
	@rm -f {dirstruct,builduser,build-tools,base,createfiles,prep-mount,tools,prepiso}
	@-for i in `ls packages` ; do $(MAKE) -C packages/$$i clean ; done
	@find packages -name "prebuild" -exec rm -f \{} \;
	@find packages -name "stage*" -exec rm -f \{} \;
	@find packages -name "*.log" -exec rm -f \{} \;
	@rm -f logs/*
	@rm -f packages/Xorg-*/*-stage2
	@rm -f packages/binutils/{a.out,dummy.c,.spectest}
	@-rm -f $(SRC) $(MY_ROOT)
	@find packages/* -xtype l -exec rm -f \{} \;
	@-rm root.ext2

scrub: clean
	@rm -f lfslivecd-$(CD_VERSION).iso lfslivecd-$(CD_VERSION)-nosrc.iso

mount: $(MKTREE)

unmount:
	-umount $(MP)/dev/shm
	-umount $(MP)/dev/pts
	-umount $(MP)/proc
	-umount $(MP)/sys
	-umount $(MP)/boot
	-umount $(MP)$(LFSSRC)
	-umount $(MP)$(SRC)
	-umount $(MP)$(TT)
	-umount $(MP)$(MY_ROOT)
	-rmdir $(MP)$(SRC) $(MP)$(TT) $(MP)$(MY_ROOT)
	-rmdir $(MP)/boot $(MP)$(LFSSRC)
	-umount $(MP)

zeroes: $(MKTREE)
	-dd if=/dev/zero of=$(MP)/zeroes
	-rm $(MP)/zeroes
	-make unmount

#==============================================================================
.PHONY: unmount clean final-environment %-stage2 %-prebuild %-stage1 \
	%-only-stage2 %-only-prebuild %-only-stage1 post-bash pre-bash
