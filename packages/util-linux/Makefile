NAME = util-linux
VER  = 2.23.1
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = https://www.kernel.org/pub/linux/utils/$(NAME)/v2.23/$(FILE)
SUM-$(FILE) = 33ba55ce82f8e3b8d7a38fac0f62779a

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	sed -i -e 's@etc/adjtime@var/lib/hwclock/adjtime@g' \
		$$(grep -rl '/etc/adjtime' .)
	mkdir -p /var/lib/hwclock
	./configure \
		--disable-su \
		--disable-sulogin \
		--disable-login
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
