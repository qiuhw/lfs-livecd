# xchat Makefile

NM= xchat
VRS= 2.8.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 7a7463e65cb26c680ed70dd96cec98bcc05435a4

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/GtkType/GType/' src/fe-gtk/xtext.{c,h}
	./configure --prefix=/usr
	make
	make install
	rsync -av --exclude .svn $(MY_ROOT)/root/.xchat2 /root/

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
