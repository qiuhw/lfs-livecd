NAME = proprietary-drivers
VER  = 3

# NVIDIA legacy driver
FILE1 = NVIDIA-Linux-x86-1.0-7184-pkg0.run
URL-$(FILE1) = http://download.nvidia.com/XFree86/Linux-x86/1.0-7184/$(FILE1)
SUM-$(FILE1) = ba3cfc1734c179cee628fba89ce557dfc0e78e31

# Current NVIDIA driver
FILE2 = NVIDIA-Linux-x86-1.0-9626-pkg0.run
URL-$(FILE2) = http://download.nvidia.com/XFree86/Linux-x86/1.0-9626/$(FILE2)
SUM-$(FILE2) = a50e04f2db7a382e60b98330d69b406e8328e436

# ATI FGLRX driver
FILE3 = ati-driver-installer-8.29.6.run
URL-$(FILE3) = http://www2.ati.com/drivers/linux/$(FILE3)
SUM-$(FILE3) = db53f411fa076bc927023f2636171b474aa360f0

include $(ROOT)/scripts/functions

stage2: $(FILE1) $(FILE2) $(FILE3)
	@touch $@

clean:
	-rm -rf $(DIR)

.PHONY: clean
