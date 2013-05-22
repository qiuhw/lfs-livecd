# SCSI firmware Makefile

NM= scsi-firmware
VRS= 1

FILE1= aic94xx-seq.fw
URL-$(FILE1)= http://kernel.org/pub/linux/kernel/people/jejb/$(FILE1)
SHA-$(FILE1)= fd4e5b1a1cc6ca077a3e7a537d7b5a911d6737d9

QLOGIC= ftp://ftp.qlogic.com/outgoing/linux/firmware

FILE2= ql2100_fw.bin
URL-$(FILE2)= $(QLOGIC)/$(FILE2)
SHA-$(FILE2)= 6af0888a1ac0db47ef07c7860ef2b648b5b4034b

FILE3= ql2200_fw.bin
URL-$(FILE3)= $(QLOGIC)/$(FILE3)
SHA-$(FILE3)= 0c805365855fee846e4b4c41805660f5c40137d5

FILE4= ql2300_fw.bin
URL-$(FILE4)= $(QLOGIC)/$(FILE4)
SHA-$(FILE4)= 03a53bf7e2408b05424a202e05b7261c7934d32f

FILE5= ql2322_fw.bin
URL-$(FILE5)= $(QLOGIC)/$(FILE5)
SHA-$(FILE5)= ac606910f140c30164f9f2c04f990d5577f7c28e

FILE6= ql2400_fw.bin
URL-$(FILE6)= $(QLOGIC)/$(FILE6)
SHA-$(FILE6)= 41470bf38b3459b4570ce8e575e5f0f59e365ff3

ALLFILES= $(foreach FILE,$(sort $(filter FILE%,$(.VARIABLES))),$($(FILE)))

# Targets

include $(ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-blfs) \
	'cd $(ROOT) && make ch-$(NM) $(chbash-post-bash)'

stage2: Makefile $(ALLFILES)
	@cp $(ALLFILES) /lib/firmware
	@touch $@

clean:

$(ALLFILES):
	$(call download,$@,$(URL-$@),$(SHA-$@))

.PHONY: clean chroot compile-stage2
