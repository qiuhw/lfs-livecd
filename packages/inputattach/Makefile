# inputattach Makefile

NAME= inputattach

# Targets

stage2: Makefile
	make -f Makefile compile-$@
	make clean
	touch $@	

compile-stage2:
	gcc $(CFLAGS) -o inputattach inputattach.c
	install -m 755 inputattach /usr/bin

clean:
	rm -f inputattach

.PHONY: clean compile-stage2
