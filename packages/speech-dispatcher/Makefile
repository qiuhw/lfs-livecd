# speech-dispatcher Makefile

NAME= speech-dispatcher
VER= 0.6.7
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.freebsoft.org/pub/projects/speechd/speech-dispatcher-0.6.7.tar.gz
SUM-$(FILE)= 00fe5051930a00c2bcdf67683410beedfa066d4e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 	-e 's/LogLevel  3/LogLevel  0/' \
		-e 's/# DefaultLanguage  "en"/DefaultLanguage  "en"/' \
		-e 's/^AddModule/#Addmodule/' \
		-e 's/#\(.*sd_espeak.*\)$$/\1/' \
		config/speechd.conf.in
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
