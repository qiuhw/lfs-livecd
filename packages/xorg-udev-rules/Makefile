# xorg udev rules Makefile

NM= xorg-udev-rules

# Targets

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile extract_pci_ids.c
	make -f Makefile compile-$@ >$(NM).log 2>&1
	make clean >>$(NM).log 2>&1
	touch $@	

compile-stage2:
	nm -D /usr/bin/Xorg | egrep ' (B|D) ' | cut -d ' ' -f 3 | grep -v __ >symbols
	for a in `cat symbols` ; do echo "char $$a[4096];" ; done >symbols.c
	gcc -rdynamic -o extract_pci_ids extract_pci_ids.c symbols.c -ldl
	echo '# Automatically generated rules, do not edit' >30-video.rules
	echo 'SUBSYSTEM!="pci", GOTO="end_video"' >>30-video.rules
	echo 'ATTR{class}!="0x030000", GOTO="end_video"' >>30-video.rules
	echo '' >>30-video.rules
	for a in /usr/lib/xorg/modules/drivers/*_drv.so ; do \
	    echo $$a ; \
	    ./extract_pci_ids $$a >>30-video.rules ; done
	echo 'LABEL="end_video"' >>30-video.rules
	install -m644 30-video.rules /etc/udev/rules.d

clean:
	rm -f extract_pci_ids symbols symbols.c 30-video.rules

.PHONY: clean chroot compile-stage2
