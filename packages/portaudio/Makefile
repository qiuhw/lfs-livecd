# portaudio Makefile

NAME= portaudio
VER= stable_v19_20071207
DIR= $(NAME)

FILE= pa_$(VER).tar.gz
URL-$(FILE)= http://www.portaudio.com/archives/pa_stable_v19_20071207.tar.gz
SUM-$(FILE)= 3841453bb7be672a15b6b632ade6f225eb0a4efc

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
