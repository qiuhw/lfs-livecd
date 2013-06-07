NAME = pcmcia-cs
VER  = 3.2.8
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.gz
URL-$(FILE) = http://pcmcia-cs.sourceforge.net/ftp/$(FILE)
SUM-$(FILE) = 38ce295c2a6baed05d792141f60a01fe6770350e

include $(ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	cd etc/cis ; rm *.cis ; rename .dat .cis *.dat
	install -m644 etc/cis/*.cis /lib/firmware

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
