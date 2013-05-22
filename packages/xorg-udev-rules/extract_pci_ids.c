#include <stdio.h>
#include <string.h>
#include <dlfcn.h>
#include <xorg/xf86str.h>

char driver_name[128];

DriverPtr GetDriverRec(char *drvname, void *handle)
{
	char mdsym[128];
	XF86ModuleData * md;
	DriverRec *result;
	sprintf(mdsym, "%sModuleData", drvname);
	md = dlsym(handle, mdsym);
	md->setup(&result, NULL, NULL, NULL);
	return result;
}

void WriteUdevRule(const char *comment, int vendor, int device)
{
	if ((vendor == 0) || (vendor == 0xff) || (vendor == 0xffff))
		return;
	if ((device == 0) || (device == 0xffff))
		return;
	printf("# %s\n"
		"ATTR{vendor}==\"0x%04x\", "
		"ATTR{device}==\"0x%04x\", "
		"RUN+=\"/bin/sed -i s/vesa/%s/ /etc/X11/xorg.conf\"\n\n",
		comment, vendor, device, driver_name);
}

int main(int argc, char *argv[])
{
	void *handle;
	char driver[128];
	char drvname[128];
	char *pos;
	DriverPtr drv;

	strcpy(driver, argv[1]);
	strcpy(drvname, argv[1]);
	pos = strstr(drvname, "_drv.so");
	if (!pos) {
		/* This file is not a driver */
		return 0;
	}
	*pos = 0;
	pos = strrchr(drvname, '/');
	if (pos)
		strcpy(driver_name, pos + 1);
	else
		/* dlopen would fail anyway */
		return 0;

	/* radeon and r128 should not be used directly, i810 is an alias for intel,
	   and sisusb is too different */
	if (!strcmp(driver_name, "radeon"))
		return 0;
	if (!strcmp(driver_name, "r128"))
		return 0;
	if (!strcmp(driver_name, "i810"))
		return 0;
	if (!strcmp(driver_name, "sisusb"))
		return 0;

	handle = dlopen(driver, RTLD_LAZY);
	if (!handle) {
		/* this driver is not interesting anyway */
		return 0;
	}
	drv = GetDriverRec(driver_name, handle);
	if (!strcmp(driver_name, "nv")) {
		drv->Identify(1);
	} else if (!strcmp(driver_name, "ati")) {
		Bool (*Probe)(struct _DriverRec *drv, int flags);
		Probe = dlsym(handle, "R128Probe");
		Probe(drv, 1);
		Probe = dlsym(handle, "RADEONProbe");
		Probe(drv, 1);
	} else {
		drv->Probe(drv, 1);
	}
	dlclose(handle);
	return 0;
}

/* Stubs that are called by Xorg drivers from Probe and Identify functions */
unsigned char byte_reversed[256];

pointer XNFalloc(unsigned long amount)
{
	return malloc(amount);
}

unsigned short StandardMinorOpcode(void * client)
{
	return 1;
}

void xf86ErrorFVerb()
{
}

void xf86AddDriver(DriverPtr drv, void * module, int unknown)
{
	DriverPtr *dest = module;
	*dest = drv;
}

int xf86MatchDevice()
{
	return 1;
}

void * xf86GetPciVideoInfo()
{
	static void* dummy = NULL;
	return &dummy;
}

void *xf86GetPciConfigInfo(void)
{
	static void* dummy = NULL;
	return &dummy;
}

void LoaderRefSymLists(const char ** dummy, ...)
{
}

void xf86LoaderRefSymLists(const char ** dummy, ...)
{
}

void xf86MsgVerb(MessageType type, int verb, const char *format, ...)
{
}

void Xfree(void * ptr)
{
}

int xf86MatchPciInstances(const char *driverName, int vendorID,
                      SymTabPtr chipsets, PciChipsets *PCIchipsets,
                      GDevPtr *devList, int numDevs, DriverPtr drvp,
                      int **foundEntities)
{
	const char *comment;
	while (PCIchipsets->PCIid != -1) {
		SymTabPtr chips = chipsets;
		while (chips->token != -1) {
			if (chips->token == PCIchipsets->numChipset)
				comment = chips->name;
			chips++;
		}
		if (!vendorID)
			vendorID = PCIchipsets->PCIid >> 16;
		WriteUdevRule(comment, vendorID, PCIchipsets->PCIid & 0xffff);
		PCIchipsets++;
	}
	return 0;
}

void xf86PrintChipsets(const char *drvname, const char *drvmsg,
                       SymTabPtr chips)
{
	/* NVidia detection special cases, see the switch(token & 0xfff0)
	   in NVProbe(), xf86-video-nv/src/nv_driver.c.
	   Risky - the driver may try to support more than it actually can */
	unsigned short wildcards[] = {
	    0x0170, 0x0180, 0x0250, 0x0280, 0x0300, 0x0310, 0x0320, 0x0330,
	    0x0340, 0x0040, 0x00C0, 0x0120, 0x0140, 0x0160, 0x01D0, 0x0090,
	    0x0210, 0x0220, 0x0240, 0x0290, 0x0390, 0x03D0, 0x0000 };

	int i;

	while(chips->token != -1) {
		i = 0;
		/* Filter out cases when the last digit doesn't matter.
		   They will be caught by wildcard rules below. */
		while (wildcards[i] && ((chips->token & 0xfff0) != wildcards[i]))
			i++;
		if ((chips->token >> 16) != 0x10de || !wildcards[i])
			WriteUdevRule(chips->name,
			    chips->token >> 16, chips->token & 0xffff);
		chips++;
	}
	/* Write out wildcard rules */
	printf("# Generic NVidia families\n");
	for (i = 0; wildcards[i]; i++)
		printf("ATTR{vendor}==\"0x10de\", "
                "ATTR{device}==\"0x%03x?\", "
                "RUN+=\"/bin/sed -i s/vesa/nv/ /etc/X11/xorg.conf\"\n",
		wildcards[i] >> 4);
	printf("\n");
}

int xf86MatchIsaInstances(const char *driverName, SymTabPtr chipsets,
                          IsaChipsets *ISAchipsets, DriverPtr drvp,
                          FindIsaDevProc FindIsaDevice, GDevPtr *devList,
                          int numDevs, int **foundEntities)
{
	return 0;
}

pointer xf86LoadDrvSubModule(DriverPtr drv, const char *name)
{
	return NULL;
}

Bool xf86ServerIsOnlyDetecting(void)
{
	return TRUE;
}
