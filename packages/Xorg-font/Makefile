NM= Xorg-font
VRS= X11R7.5
URLBASE= $(HTTP)/$(NM)

include $(MY_ROOT)/packages/$(NM)/filelist

ALLFILES= $(foreach FILE,$(sort $(filter FILE%,$(.VARIABLES))),$($(FILE)))

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(ALLFILES)
	$(foreach DIR,$(subst .tar.bz2,,$(ALLFILES)),make FILE=$(DIR).tar.bz2 DIR=$(DIR) $(DIR)-stage2 && ) true
	install -v -d -m755 /usr/share/fonts
	ln -svnf /usr/lib/X11/fonts/OTF /usr/share/fonts/X11-OTF
	ln -svnf /usr/lib/X11/fonts/TTF /usr/share/fonts/X11-TTF

compile-%-stage2:
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var
	make
	make install

%-stage2:
	$(std_build)

clean:
	rm -rf *-*/
