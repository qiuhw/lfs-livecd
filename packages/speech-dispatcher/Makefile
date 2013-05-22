# speech-dispatcher Makefile

NM= speech-dispatcher
VRS= 0.6.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 00fe5051930a00c2bcdf67683410beedfa066d4e

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
