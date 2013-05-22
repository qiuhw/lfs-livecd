# jhalfs Makefile

NM= jhalfs
VRS= trunk
DIR= $(NM)-$(VRS)

# Using trunk version for now...

include $(MY_ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(FILE1)
	@$(call echo_message, Building)
	@touch $(DIR)-$@.log
	@-ln -sf ../packages/$(shell basename `pwd`)/$(DIR)-$@.log $(MY_ROOT)/logs/ 
	@make compile-$@ 2>&1 | tee -a $(MY_ROOT)/logs/build.log >>$(DIR)-$@.log ; exit $${PIPESTATUS[0]}
	@touch $@
	
compile-stage2:
	mkdir -p /home/jhalfs
	cd /home/jhalfs ; svn export svn://linuxfromscratch.org/ALFS/jhalfs/trunk jhalfs-trunk
	cp -v $(MY_ROOT)/root/.bashrc /home/jhalfs/.bashrc
	chown -R jhalfs:jhalfs /home/jhalfs

clean:

.PHONY: clean compile-stage2
