NAME= livecd-bootscripts
VER= SVN

# Targets

SCRIPTS= clkconf langconf brltty brltty-restart speakup speakup-restart
DATA= font.dat font-errors.dat lang.dat

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(SCRIPTS) $(DATA)
	@make -f Makefile compile-$@ >>$(NAME)-$@.log 2>&1
	@touch $@

compile-stage2:
	install -d -m755 /etc/langconf
	install -m754 $(SCRIPTS) /etc/rc.d/init.d
	install -m644 $(DATA) /etc/langconf
	ln -sf ../init.d/brltty /etc/rc.d/rcsysinit.d/S12brltty
	ln -sf ../init.d/speakup /etc/rc.d/rcsysinit.d/S12speakup
	ln -sf ../init.d/clkconf /etc/rc.d/rcsysinit.d/S59clkconf
	ln -sf ../init.d/langconf /etc/rc.d/rcsysinit.d/S69langconf
	# brltty has to be restarted in order to see the font change
	# and speakup has to react to the language change
	ln -sf ../init.d/brltty-restart /etc/rc.d/rcsysinit.d/S71brltty-restart
	ln -sf ../init.d/speakup-restart /etc/rc.d/rcsysinit.d/S71speakup-restart

clean:

.PHONY: clean compile-stage2
