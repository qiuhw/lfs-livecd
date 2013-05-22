# inputattach Makefile

NM= inputattach

# Targets

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile
	make -f Makefile compile-$@
	make clean
	touch $@	

compile-stage2:
	gcc $(CFLAGS) -o inputattach inputattach.c
	install -m 755 inputattach /usr/bin

clean:
	rm -f inputattach

.PHONY: clean chroot compile-stage2
