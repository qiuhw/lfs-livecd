NM= X.org-base
VRS=X11R7.5

include $(MY_ROOT)/scripts/functions

stage2: Makefile
	@mkdir -p /etc/X11/app-defaults /etc/X11/xinit
	@mkdir -p /usr/lib/X11 /usr/share/X11
	@ln -nsf /etc/X11/app-defaults /usr/share/X11/app-defaults
	@ln -nsf /etc/X11/xinit /usr/lib/X11/xinit
	@echo -e "#!/bin/sh\nexec /usr/bin/X -nolisten tcp" >/etc/X11/xinit/xserverrc
	@chmod 755 /etc/X11/xinit/xserverrc
	@install -m644 $(MY_ROOT)/etc/X11/xorg.conf /etc/X11/xorg.conf
	@touch $@

clean:
