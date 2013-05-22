# net-tools Makefile

NM= net-tools
VRS= 1.60
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.tazenda.demon.co.uk/phil/net-tools/$(FILE)
SHA-$(FILE)= 944fb70641505d5d1139dba3aeb81ba124574b83

PATCH1= $(DIR)-gcc34-3.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/blfs/svn/$(PATCH1)
SHA-$(PATCH1)= a92286932a423fc987f2a152931d05b0a9a312bd

PATCH2= $(DIR)-kernel_headers-2.patch
URL-$(PATCH2)= http://www.linuxfromscratch.org/patches/blfs/svn/$(PATCH2)
SHA-$(PATCH2)= 3e59577e904582503b25c7b21f6e3b77b165f84a

PATCH3= $(DIR)-mii_ioctl-1.patch
URL-$(PATCH3)= http://www.linuxfromscratch.org/patches/blfs/svn/$(PATCH3)
SHA-$(PATCH3)= 912613acbf3a000a2935391a14e55b5ccdeeae6b

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-post-bash) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(FILE) $(PATCH1) $(PATCH2) $(PATCH3)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	patch -Np1 -i ../$(PATCH2)
	patch -Np1 -i ../$(PATCH3)
	yes "" | make config
	sed -i -e 's|HAVE_IP_TOOLS 0|HAVE_IP_TOOLS 1|g' -e 's|HAVE_MII 0|HAVE_MII 1|g' config.h
	sed -i -e 's|# HAVE_IP_TOOLS=0|HAVE_IP_TOOLS=1|g' -e 's|# HAVE_MII=0|HAVE_MII=1|g' config.make
	make
	make update

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
