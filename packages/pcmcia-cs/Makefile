# PCMCIS-CS Makefile

# Is it OK to download a 1 MB package just for 10 KB of cis-files?
NM= pcmcia-cs
VRS= 3.2.8
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://pcmcia-cs.sourceforge.net/ftp/$(FILE)
SHA-$(FILE)= 38ce295c2a6baed05d792141f60a01fe6770350e

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cd etc/cis ; rm *.cis ; rename .dat .cis *.dat
	install -m644 etc/cis/*.cis /lib/firmware

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
