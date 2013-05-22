# Bash Makefile

NM= bash
VRS= 4.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
SHA-$(FILE)= 3bd1ec9c66f3689f6b3495bdaaf9077b2e5dc150

# Targets

include $(MY_ROOT)/scripts/functions

ftpget:
	@cd $(SRC) ; sh $(MY_ROOT)/scripts/ftpget $(NM) $(VRS)
	@touch $@

prebuild: ftpget $(FILE)
	@$(call echo_message, Building)
	@touch $(DIR)-$@.log
	@-ln -sf $(MY_ROOT)/packages/$(shell basename `pwd`)/$(DIR)-$@.log $(MY_ROOT)/logs/
	@unpack $(FILE) >>$(DIR)-$@.log 2>&1
	@make -C $(DIR) -f ../Makefile compile-$@>>$(DIR)-$@.log 2>&1
	@make clean >>$(DIR)-$@.log 2>&1
	@touch $@

compile-prebuild:
	./configure --prefix=$(TT) --without-bash-malloc
	make
	make install
	ln -sfv bash $(TT)/bin/sh

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=$(TT) --without-bash-malloc
	make
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--bindir=/bin \
		--without-bash-malloc \
		--with-installed-readline
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-prebuild compile-stage1 clean compile-stage2
