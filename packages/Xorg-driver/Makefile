NM= Xorg-driver
VRS= X11R7.5
URLBASE= $(HTTP)/$(NM)

include $(MY_ROOT)/packages/$(NM)/filelist

ALLFILES= $(foreach FILE,$(sort $(filter FILE%,$(.VARIABLES))),$($(FILE)))

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(ALLFILES)
	$(foreach DIR,$(subst .tar.bz2,,$(ALLFILES)),make FILE=$(DIR).tar.bz2 DIR=$(DIR) $(DIR)-stage2 && ) true

compile-%-stage2:
	case $(DIR) in \
	 xf86-input-evdev-[0-9]* | xf86-video-ati-[0-9]* | \
	 xf86-video-fbdev-[0-9]* | xf86-video-glint-[0-9]* | \
	 xf86-video-newport-[0-9]* ) \
	 sed -i -e "s/\xc3\xb8/\\\\[\/o]/" \
	   -e "s/\xc3\xa4/\\\\[:a]/" \
	   -e "s/\xc3\x9c/\\\\[:U]/" man/*.man ;; \
	 xf86-video-s3-[0-9]* | xf86-video-xgi-[0-9]* ) \
	 for file in `grep -Rl "xf86Version.h" *` ; do \
      sed 's@xf86Version.h@xorgVersion.h@g' -i "$$file" ; done ;; \
    esac
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--localstatedir=/var \
	 	--with-xorg-module-dir=/usr/lib/X11/modules
	make
	make install

%-stage2:
	$(std_build)

clean:
	rm -rf *-*/
