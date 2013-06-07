NAME = gmp
VER  = 5.1.2
DIR  = $(NAME)-$(VER)

FILE = $(DIR).tar.xz
URL-$(FILE) = http://ftp.gnu.org/gnu/$(NAME)/$(FILE)
SUM-$(FILE) = 06fe2ca164221c59ce74867155cfc1ac

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr \
		--enable-cxx
	make
	make check 2>&1 | tee gmp-check-log
	awk '/tests passed/{total+=$2} ; END{print total}' gmp-check-log
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage2 clean
