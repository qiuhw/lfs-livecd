# lilo Makefile

NAME= lilo
VER= 22.8
DIR= $(NAME)-$(VER)

FILE= $(DIR).src.tar.gz
URL-$(FILE)= http://home.san.rr.com/johninsd/pub/linux/lilo/$(FILE)
SUM-$(FILE)= 59852eab59b93dcea63b39eef1db7963b7268b0d

# Targets

include $(ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	# We don't set -DATARAID because it doesn't work (DM major is dynamic)
	sed -i 's/-DMDPRAID/& -DDEVMAPPER -DAUTOAUTO/' Makefile
	make ROOT="" all
	make ROOT="" install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
