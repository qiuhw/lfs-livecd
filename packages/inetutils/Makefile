# Inetutils Makefile

NAME= inetutils
VER= 1.7
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://ftp.gnu.org/gnu/inetutils/inetutils-1.7.tar.gz
SUM-$(FILE)= d5fdee9855a06663ca7c0a8150c09439ef520206

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/sbin \
		--localstatedir=/var \
		--disable-logger \
		--disable-syslogd \
		--disable-whois \
		--disable-servers
	make
	make install
	mv -v /usr/bin/{hostname,ping,ping6} /bin
	mv -v /usr/bin/traceroute /sbin

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
