NAME = synaptics
VER  = 0.14.6
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.bz2
URL-$(FILE) = http://web.telia.com/~u89404340/touchpad/files/$(FILE)
SUM-$(FILE) = 41443e253e73546657b40435c8c9bfa0a91662bc

include $(ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	make PREFIX=/usr MANDIR=/usr/share/man
	make PREFIX=/usr MANDIR=/usr/share/man install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
