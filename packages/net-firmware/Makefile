# network firmware Makefile

NM= net-firmware
VRS= 1

UNCOMPRESSED_FILE1= t3fw-3.3.0.bin
FILE1= $(UNCOMPRESSED_FILE1).gz
URL-$(FILE1)= http://service.chelsio.com/drivers/firmware/t3/$(FILE1)
SHA-$(FILE1)= 6c2965f7eaa7e0f18c2e7d7e9afe470850b502ee

# FILE2 was for Myri10GE, but there is no way to automate the download
# due to one-time URLs used for license checks. Removed.

DIR3= atmel-firmware-1.3
FILE3= $(DIR3).tar.gz
URL-$(FILE3)= http://www.thekelleys.org.uk/atmel/$(FILE3)
SHA-$(FILE3)= 8027f505dc49c8322c8593ce05ec2b73391b74c7

FILE4= wl_apsta.o
URL-$(FILE4)= http://svit.epfl.ch/stuff/$(FILE4)
SHA-$(FILE4)= b1f61d283bd7d05ade313da522cb0d0ad4033652

DIR5= bcm43xx-fwcutter-006
FILE5= $(DIR5).tar.bz2
URL-$(FILE5)= http://download.berlios.de/bcm43xx/$(FILE5)
SHA-$(FILE5)= 45e43fb7784812def77c1190dcab122f73a20708

DIR6= ipw2100-fw-1.3
FILE6= $(DIR6).tgz
URL-$(FILE6)= http://bughost.org/firmware/$(FILE6)
SHA-$(FILE6)= aa8276f9710dc009566952d49677cb824ab866a7

DIR7= ipw2200-fw-3.0
FILE7= $(DIR7).tgz
URL-$(FILE7)= http://bughost.org/firmware/$(FILE7)
SHA-$(FILE7)= 84c28f1bed09c4d54bedf43492bd7884d0593928

# 2.7.0.0 is for a different driver
FILE8= 1.0.4.3.arm
URL-$(FILE8)= http://prism54.org/firmware/$(FILE8)
SHA-$(FILE8)= d0b5260b64e624c933ad506f85730ce07598431c

FILE9= 1.1.0.0.arm
URL-$(FILE9)= http://prism54.org/firmware/$(FILE9)
SHA-$(FILE9)= 9ad6ce05cbf162e4f3c1c4759b3a010535cfca54

DIR10= zd1201-0.14-fw
FILE10= $(DIR10).tar.gz
URL-$(FILE10)= http://easynews.dl.sourceforge.net/sourceforge/linux-lc100020/$(FILE10)
SHA-$(FILE10)= 8f0510576f06fe00b4ac2e5eaadecbf208b47ae7

DIR11= zd1211-firmware
FILE11= $(DIR11)1.3.tar.bz2
URL-$(FILE11)= http://easynews.dl.sourceforge.net/sourceforge/zd1211/$(FILE11)
SHA-$(FILE11)= affce8c1167c9df1fcd8b53826ee0cb8d40ec12f

DIR12= orinoco-fwutils-0.2
FILE12= $(DIR12).tar.gz
URL-$(FILE12)= http://easynews.dl.sourceforge.net/sourceforge/orinoco/orinoco-fwutils-0.2.tar.gz
SHA-$(FILE12)= 02557624c3ea0b7b61ffc4aeb7f1a0c5270c5c3e

FILE13= MC&DriverOnlyInstallers.zip
URL-$(FILE13)= ftp://symstore.longisland.com/Symstore/services_download/wirless_prod/$(FILE13)
SHA-$(FILE13)= b597eb9afc23beca309e8e8001edd88e5521dd92

FILE14= usb8388_A1_W8015FP14_FW2.bin
URL-$(FILE14)= http://www.marvell.com/drivers/upload/$(FILE14)
SHA-$(FILE14)= 5e351ab2ac01e8648a2012800ad2d67b06d2870e

DIR15= stir4210_4220_4116_patch_files
FILE15= $(DIR15).tar.gz
URL-$(FILE15)= http://www.sigmatel.com/documents/$(FILE15)
SHA-$(FILE15)= bee20b114e3f29c28819ec6a716472621bf6ac47

DIR16= RT61_Firmware_V1.2
FILE16= $(DIR16).zip
URL-$(FILE16)= http://www.ralinktech.com.tw/data/$(FILE16)
SHA-$(FILE16)= 8a50899160d1ef1cd9770e4f0426930fb2b42a1b

DIR17= RT71W_Firmware_V1.8
FILE17= $(DIR17).zip
URL-$(FILE17)= http://www.ralinktech.com.tw/data/$(FILE17)
SHA-$(FILE17)= 51541bec5cf2fe6ff46e46a0bb157b774d2ff050

DIR18= iwlwifi-3945-ucode-2.14.4
FILE18= $(DIR18).tgz
URL-$(FILE18)= http://intellinuxwireless.org/iwlwifi/downloads/$(FILE18)
SHA-$(FILE18)= c715e4f0ab4ddddb45f6b5c36644e13dc0cd0b2c

DIR19= iwlwifi-4965-ucode-4.44.17
FILE19= $(DIR19).tgz
URL-$(FILE19)= http://intellinuxwireless.org/iwlwifi/downloads/$(FILE19)
SHA-$(FILE19)= 955d8718419dc2670d9b8167e22df118a36666a5

ALLFILES= $(foreach FILE,$(sort $(filter FILE%,$(.VARIABLES))),$($(FILE)))

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(ALLFILES)
	@zcat $(FILE1) >/lib/firmware/$(UNCOMPRESSED_FILE1)
	@tar xf $(FILE3)
	@find $(DIR3) -name \*.bin | xargs -i cp \{\} /lib/firmware
	@tar xf $(FILE5)
	@cd $(DIR5) ; make ; ./bcm43xx-fwcutter ../$(FILE4) ; cp *.fw /lib/firmware
	@mkdir $(DIR6) ; cd $(DIR6) ; tar xf ../$(FILE6) ; cp * /lib/firmware
	@tar xf $(FILE7) ; cp $(DIR7)/* /lib/firmware
	@cp $(FILE8) /lib/firmware ; \
	    for a in 86 90 ; do ln -sf $(FILE8) /lib/firmware/isl38$$a ; done
	@cp $(FILE9) /lib/firmware ; ln -sf $(FILE9) /lib/firmware/isl3877
	@tar xf $(FILE10) ; cp $(DIR10)/*.fw /lib/firmware
	@tar xf $(FILE11) ; mkdir -p /lib/firmware/zd1211 ; \
	    cp $(DIR11)/zd* /lib/firmware/zd1211
	@tar xf $(FILE12) ; cd $(DIR12) ; cp "../$(FILE13)" . ; \
	    ./get_symbol_fw ; cp symbol_* /lib/firmware
	@cp $(FILE14) /lib/firmware/usb8388.bin
	@mkdir $(DIR15) ; cd $(DIR15) ; tar xf ../$(FILE15) ; install -m 644 *.sb /lib/firmware
	@unzip $(FILE16) ; cp $(DIR16)/*.bin /lib/firmware
	@unzip $(FILE17) ; cp $(DIR17)/*.bin /lib/firmware
	@tar xf $(FILE18) ; cp $(DIR18)/* /lib/firmware
	@tar xf $(FILE19) ; cp $(DIR19)/* /lib/firmware
	@make clean
	@touch $@

clean:
	rm -rf */

$(ALLFILES):
	$(call download,$@,$(URL-$@),$(SHA-$@))

.PHONY: clean chroot compile-stage2
