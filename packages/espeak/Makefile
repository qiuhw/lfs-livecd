# espeak Makefile

NM= espeak
VRS= 1.43.03
DIR= $(NM)-$(VRS)-source

FILE= $(DIR).zip
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 354dad04ccd96cc2f03f647d06b6d45aba593681

# Russian file is not downloaded because espeak mispronounces many words
# (because it doesn't know about "hard" and "soft" consonants)
# and Russian is thus unusable at this time, even with this file.
# http://espeak.sourceforge.net/data/russian_data.zip
#
# Chinese file is not downloaded because Chinese cannot be used in
# Linux console.
# http://espeak.sourceforge.net/data/zhy_list.zip

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	@$(call echo_message, Building)
	@touch $(DIR)-$@.log
	@-ln -sf ../packages/$(shell basename `pwd`)/$(DIR)-$@.log $(MY_ROOT)/logs/ 
	@unzip $(FILE) 2>&1 | tee -a $(MY_ROOT)/logs/build.log >$(DIR)-$@.log ; exit $${PIPESTATUS[0]}
	@make -C $(DIR) -f ../Makefile compile-$@ 2>&1 | tee -a $(MY_ROOT)/logs/build.log >>$(DIR)-$@.log ; exit $${PIPESTATUS[0]}
	@make clean 2>&1 | tee -a $(MY_ROOT)/logs/build.log >>$(DIR)-$@.log ; exit $${PIPESTATUS[0]}
	@touch $@

compile-stage2:
	cp -v src/portaudio19.h src/portaudio.h
	make -C src
	make -C src install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
