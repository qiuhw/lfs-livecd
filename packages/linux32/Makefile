# linux32 Makefile

NM= linux32

# Targets

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile
	make -f Makefile compile-$@
	make clean
	touch $@	

compile-stage2:
	gcc $(CFLAGS) -o linux32 linux32.c
	install -m 755 linux32 /usr/bin
	install -m644 linux32.1 /usr/share/man/man1
	ln -sf linux32 /usr/bin/linux64
	ln -sf linux32.1 /usr/share/man/man1/linux64.1

clean:
	rm -f linux32

.PHONY: clean chroot compile-stage2
