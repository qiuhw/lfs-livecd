# DB Makefile

NAME= db
VER= 4.7.25
DIR= $(NAME)-$(VER)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://download-east.oracle.com/berkeley-db/db-4.7.25.tar.gz
SUM-$(FILE)= 957c10358df1211e1dc37ea997aadef42117d6a5

PATCH1= $(DIR)-upstream_fixes-1.patch
URL-$(PATCH1)= http://www.linuxfromscratch.org/patches/lfs/6.4/db-4.7.25-upstream_fixes-1.patch
SUM-$(PATCH1)= 737f11c8f7f9b7bd2523f6c19460bd0aacd6799f

# Targets

include $(ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH1)
	cd build_unix ; ../dist/configure --prefix=/usr \
	    --enable-compat185 --enable-cxx
	cd build_unix ; make
	cd build_unix ; make docdir=/usr/share/doc/$(DIR) install
	chown -Rv root:root /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
