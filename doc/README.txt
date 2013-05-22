Official Linux From Scratch LiveCD
==================================
Version: [Version]


PACKAGES
--------

Available packages on this CD for your use:

 * Xorg (X Window System Environment)

 * Xfce desktop environment

 * Web Tools

   - wget (command line file retriever)
   - curl (command line file retriever)
   - lynx (text web browser)
   - w3m (text web browser)
   - irssi (console irc client)
   - seamonkey (graphical web browser, mail and news reader and irc client)
   - xchat (x-based irc client)
   - pidgin (multiprotocol x-based chat client)
   - finch (multiprotocol console chat client -- works in UTF-8 locales only)
   - msmtp (SMTP client for use with mutt and tin)
   - mutt (console email client)
   - tin (console news reader)

 * Text Editors

   - vim
   - nano
   - joe

 * Network Tools

   - SSH server & client
   - NFS server & client
   - Samba server & client
   - Subversion
   - cvs
   - pppd
   - rp-pppoe
   - pptp client
   - dhcpcd
   - ncftp
   - traceroute
   - rsync

 * Filesystem Programs

   - e2fsprogs
   - reiserfsprogs
   - reiser4progs
   - xfsprogs
   - dosfstools
   - ntfsprogs
   - jfsutils

 * Debugging Programs

   - strace

 * Boot Loaders

   - grub
   - lilo

 * Other Programs

   - distcc
   - gpm (console mouse)
   - pciutils
   - mdadm
   - LVM2
   - dmraid
   - kpartx
   - hdparm
   - parted
   - xlockmore

This CD also includes jhalfs (a tool for extracting commands from the
Linux From Scratch book and creating Makefiles that can download, check
and build each LFS package for you.)

You can compile other programs from sources directly on the CD. All locations
on the CD can be written to (including /usr).

VMWARE ISSUE
------------

This CD does not detect virtual SCSI disks connected to a virtual machine in
VMware Workstation 5.x or earlier or VMware Server 1.0.3 or earlier. This is
a known VMware bug. The solution is to upgrade to VMware Workstation >= 6.0 or
VMware Server >= 1.0.4.

The following workarounds help for older versions of VMware products:

 * Choose "BusLogic" as the virtual SCSI controller type instead of the
default "LSI Logic".

 * Pass the "mptbase.mpt\_channel\_mapping=1" option to the kernel command line.

The same issue will be present on an LFS system built from this CD.

CONFIGURING NET CONNECTION
--------------------------

The LiveCD attempts to detect the network cards present in the system.
On each detected network card, dhcpcd is automatically started in the
background. If it is not correct to acquire the network settings via DHCP
in your location, or if you want to use dialup or GPRS connection, run the
"net-setup" command.

If you don't want the CD to start dhcpcd on the detected network cards,
type "linux nodhcp" at the boot loader prompt. This may be required for
wireless connections that utilize WEP or WPA encryption.

CONFIGURING X
-------------

The LiveCD attempts to configure X for your video card automatically. The
process may fail if you have more than one video card, if your video card
does not support 24-bit color depth, or if your monitor is not Plug-n-Play
compatible (in other words, does not tell its characteristics to Xorg via DDC).
In such cases, you have to edit the /etc/X11/xorg.conf file manually, using
vim, joe or nano, as described below.

In Section "Device", specify the driver for your video card, e.g.:

    Section "Device"
        Identifier      "Generic Video Card"
        Driver          "vesa"
    EndSection

In Section "Monitor", specify the allowed frequency ranges for your
monitor. If unsure, consult the manual that came with your monitor. If
such information is not there, but you know a working resolution and refresh
rate, run the "gtf" command. E.g., if your monitor can handle 1280x1024@85Hz:

    $ gtf 1280 1024 85

[NOTE]
You must specify the refresh rate of 60 Hz for VGA-connected LCD monitors.

Then look at the output:

    # 1280x1024 @ 85.00 Hz (GTF) hsync: 91.38 kHz; pclk: 159.36 MHz
    Modeline "1280x1024_85.00"  159.36  1280 1376 1512 1744  1024 1025 1028 1075 -HSync +Vsync

Put the synchronization ranges that contain the printed values. For the above
example, this means that the following information should be added in the
"Monitor" section:

    Section "Monitor"
        Identifier	"Generic Monitor"
        Option		"DPMS"
        # Option	"NoDDC" # for broken monitors that
        			# report max dot clock = 0 MHz
        HorizSync	30-92   # because gtf said "hsync: 91.38 kHz"
        VertRefresh	56-86   # because an 85 Hz mode has been requested
        # the Modeline may also be pasted here
        Option "PreferredMode" "1280x1024_85.00" # only for the "intel" driver
    EndSection

In the Section "Screen", change the DefaultDepth and add the "Modes"
line to SubSection "Display" with the proper color depth. If you added custom
Modelines, you have to specify them exactly as defined, i.e. "1280x1024_85.00"
in the example above. The built-in Modelines have names similar to "1024x768",
without explicit specification of the refresh rate.

When you are finished editing /etc/X11/xorg.conf, run "startx".

PROPRIETARY VIDEO DRIVERS
-------------------------

The CD contains pre-built proprietary video drivers in the /drivers directory
(if you loaded the CD contents to RAM, you have to mount the CD and look into
/media/cdrom/drivers instead). They are never selected by default by the
autoconfiguration process. Here is how to enable them.

### NVIDIA ###

    cd /drivers
    tar -C / -xf NVIDIA-Linux-[userspace_arch]-[version]-glx.tgz
    tar -C / -xf NVIDIA-Linux-[kernel_arch]-[version]-kernel-[kernel_version].tgz
    depmod -ae
    ldconfig
    vim /etc/X11/xorg.conf   # use the "nvidia" driver instead of "vesa" or "nv"

### FGLRX ###

    cd /drivers
    tar -C / -xf fglrx-x710-[version]-[userspace_arch]-1.tgz
    tar -C / -xf fglrx-module-[version]-[kernel_arch]-1_kernel_[kernel_version].tgz
    depmod -ae
    ldconfig
    vim /etc/X11/xorg.conf   # use the "fglrx" driver instead of "vesa" or "ati"

CUSTOMIZING THE CD CONTENTS
---------------------------

It is possible to burn a customized version of the official Linux From
Scratch LiveCD, with changed default boot parameters and/or your own files
added.

To change the default boot arguments, follow these steps as root.

 * Create directories:

        export WORK=/mnt/lfslivecd
        mkdir -p $WORK/{orig,copy}
	
 * Copy all files except root.ext2 from the original image:

        mount -t iso9660 -o loop lfslivecd-[version].iso $WORK/orig
        cp -a $WORK/orig/*/ $WORK/orig/README.html $WORK/copy/
        umount $WORK/orig
	
 * Copy the compressed root.ext2 file without uncompressing it:

        mount -t iso9660 -o loop,norock lfslivecd-[version].iso $WORK/orig
        cp $WORK/orig/root.ext2 $WORK/copy/
        chmod 644 $WORK/copy/root.ext2
        umount $WORK/orig
	
 * Edit the boot loader configuration:

        # Append new kernel options to the "append" lines
        vim $WORK/copy/boot/isolinux/isolinux.cfg
	
 * Create the new LiveCD image:

        mkisofs -z -R -l --allow-leading-dots -D -o \
            lfslivecd-[version]-custom.iso -b boot/isolinux/isolinux.bin \
            -c boot/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table \
            -V "lfslivecd-[version]" $WORK/copy

[NOTE]
You cannot change the volume label of the customized CD (i.e., the
argument to the "-V" option) this way. The "-nosrc" suffix is not part of
the volume label and should be left out, but "-min" should be preserved.

To add or remove files, follow the instructions in the
/root/lfscd-remastering-howto.txt file instead.

AUTOSSHD
--------

It is possible to start the sshd daemon automatically upon boot. To do that,
you have to customize the CD. Create the following files:

/.autosshd:
    This is the file that indicates that the sshd daemon should be
    started automatically. It should be empty.

/root/.ssh/authorized_keys:
    Add your public key to that file in order to be able to log in.
    Alternatively, modify /etc/shadow.

/etc/shadow:
    Edit this file if you want to allow root to login using a password via
    ssh. It is more secure to use public key based authentication instead.

/etc/ssh/ssh\_host\_dsa\_key, /etc/ssh/ssh\_host\_rsa\_key:
    Create those files as described in the *ssh-keygen(1)* manual page. If you
    do not do that, random host keys will be generated for you automatically
    during the boot process. This is less secure, because you cannot verify
    them.

/etc/sysconfig/network-devices/ifconfig.eth0:
    Configure a known static IP address there, as described in the LFS book,
    section "7.12. Configuring the network Script".

INTERNATIONALIZATION
--------------------

It is possible to specify the locale using the bootloader prompt, like this:

    linux LANG=es_ES@euro


For some locales (e.g. lv_LV.ISO-8859-13) there is no valid console keymap,
but there is a keymap for X. In this case, the only solution is to use X.

While this CD configures the "LANG" environment variable, console font and
keymap for you, it is your responsibility to configure other locale-dependent
parameters manually. You have to explicitly specify the "iocharset" and
"codepage" options when mounting filesystems with Windows origin
(e.g., vfat and isofs).

The CD contains TrueType fonts that cover the orthography of most of European
and some Asian languages. No additional configuration is required in order to
use these fonts.

Use of this LiveCD with Chinese, Japanese or Korean language requires that
your monitor has at least 80 pixels per inch in order for hieroglyphs to
be recognizable (i.e., at least 12 pixels high). This means the following
minimum resolution:

    15"  =>    1024x768
    17"  =>    1024x768
    19"  =>   1280x1024
    20"  =>   1280x1024

If your monitor cannot handle such resolution, edit the
/etc/X11/xinit/xserverrc file with vim, nano or joe, and add the "-dpi 94"
parameter to the X server command line there.

ACCESSIBILITY
-------------

The Live CD includes software (BRLTTY and speakup) that make the contents
of the Linux text console accessible to visually-impaired users. This
software is not started by default, and special boot parameters (documented
below) are needed in order to use it.

Unfortunately, the boot loader expects the parameters to be entered with
US English keyboard layout, which is not familiar to non-US users, and they
cannot see their mistakes. Thus, it is recommended for such users to
customize default boot parameters of the CD as described above instead of
trying to type them at the boot prompt.

### BRAILLE DISPLAY SUPPORT ###

The LiveCD includes the "brltty" program that allows a blind person to read
the contents of the Linux text console on a Braille display. In order to
activate it, insert the CD into the drive, reboot the computer. Some BIOSes
will produce a beep indicating successful power-on self-testing. If so, the
boot loader will produce a second beep indicating the boot prompt is available.
After that beep (first or second depending on if your computer normally beeps
upon startup), type:

    linux brltty=eu,ttyS0

[NOTE]
This example assumes that the EuroBraille device is connected to the
first serial port. For other device types, the "brltty" parameter will
be different.

[NOTE]
In some locales, "brltty" displays incorrect Braille patterns. This is
related to the fact that Braille tables in brltty are indexed with
encoding-dependent bytes representing the character. Such representation
becomes invalid when another encoding for the same language is used.
E.g., that is why the "ru" table (designed for the KOI8-R encoding) produces
wrong result in the ru_RU.CP1251 locale.

#### Known non-working cases ####

 * All CP1251-based locales (no CP1251 Braille table in "brltty")

 * All UTF-8 locales (kernel deficiency)

 * zh_TW (configuration instructions available in Chinese only). If you use
   this locale, please send mail to <livecd@linuxfromscratch.org>
   and help us add support for it.

 * All other Chinese, Japanese and Korean locales (no support in 'brltty')

If 'brltty' displays incorrect Braille patterns in your locale, please revert
to the en_US locale, thus avoiding the use of non-ASCII characters. If you
know how to fix this problem for your locale, mail this information to
<livecd@linuxfromscratch.org>.

### SPEECH OUTPUT WITH SPEAKUP ###

This CD includes a development version of Speakup (because no stable versions
work with linux-2.6.22.x), as an alternative method that allows a blind person
to access the contents of Linux console with the help of a hardware speech
synthesizer or the "espeak" software text-to-speech engine. In order to
activate it, insert the CD into the drive, reboot the computer. Some BIOSes
will produce a beep indicating successful power-on self-testing. If so, the
boot loader will produce a second beep indicating the boot prompt is available.
After that beep (first or second depending on if your computer normally beeps
upon startup), type:

    linux speakup.synth=soft

[NOTE]
This example assumes that the software text-to-speech engine has to be used.

Hardware speech synthesizers are also supported. E.g., for a
DoubleTalk LT/LiteTalk synthesizer connected to /dev/ttyS1, use the
following command line:

    linux speakup.synth=ltlk speakup.ser=2

Documentation on the official Speakup home page <http://www.linux-speakup.org/>
applies to the stable version of Speakup (2.0) and thus contains outdated
information. Nevertheless, users that are new to Speakup should read it,
keeping this fact in mind.

The key user-visible differences between the included version of Speakup
and Speakup 2.0 are listed below.

 * Copying and pasting produces garbage characters and can crash the computer
   (use the "screen" program instead of the built-in copy-and-paste feature).
 * Kernel parameters are renamed:
   + speakup\_synth became speakup.synth, and the "sftsyn" synthesizer
     became "soft";
   + speakup\_ser became speakup.ser, and serial ports are now numbered
     starting from 1, not from 0 (i.e., speakup_ser=1 became speakup.ser=2);
   + speakup\_quiet became speakup.quiet, valid values are 0 and 1;
   + speakup\_port became speakup.port.
 * The /proc/speakup/synth interface does not exist.

Speakup has been tested only with the en_US locale and may work incorrectly in
other locales.

RESUMING THE BUILD
------------------

There is a hint "How to resume your work after a break at different
-LFS stages" available at:

<http://www.linuxfromscratch.org/hints/downloads/files/stages-stop-and-resume.txt>

Instructions from there should work on this CD, however, there is a simpler
method ("hibernation") described below.

Make sure you have (or are planning to create) a swap partition not used
by other Linux systems installed on your hard drive. The text below assumes
that /dev/hda2 is your (existing or planned) swap partition.

Pass "resume=/dev/hda2" as one of the kernel arguments when booting this CD.
I.e., the complete boot line may look as:

    linux LANG=ru_RU.UTF-8 TZ=Asia/Yekaterinburg resume=/dev/hda2

Alternatively, once the system is running, you can activate hibernation by
echoing the major and minor numbers of the partition to '/sys/power/resume' as
such:

    # ls -l /dev/hda2
    brw-rw---- 1 root disk 3, 2 2006-07-10 17:51 /dev/hda2
    # echo 3:2 >/sys/power/resume

At this point, the system is up and running. If you do not already have a
swap partition, or wish to create a new one, chapter 2 of the LFS book will
show you how to create, format, and activate one.

If you use the X window system, take the following into account:

   * Users of old S3 video cards should uncomment the "EnableVbetool" line
     in the /etc/hibernate/common.conf file.

   * Hibernation is incompatible with the proprietary "nvidia" driver.

Follow the book as your time permits.

When your time runs out, execute the "hibernate" command as root. It is not
necessary to stop the compilation, but running this command during a
testsuite may lead to failures that would not occur otherwise.

[NOTE]
You must unmount all USB flash drives and all partitions used by other
operating systems installed on your computer before hibernating! Do not
attempt to mount partitions used by a hibernated system from other systems
(even read-only, because there is no true read-only mount on journaled
filesystems)!

On some systems, hibernation refuses to work due to a broken ACPI
implementation, with the following message in "dmesg | tail"  output:

    acpi_pm_prepare does not support 4

Possible solutions:

   1. run the following command before hibernating the computer:

        echo shutdown >/sys/power/disk

   2. disable ACPI completely by adding "acpi=off" to the kernel arguments.

The computer will save its state to your swap partition and power down.
This CD will remain in the drive.

When you are ready to resume the build, boot this CD again and pass exactly
the same "vga=..." and "resume=..." arguments that you used earlier.

The computer will load its state from the swap partition and behave as if
you did not power it off at all (except breaking all network connections).
The build will automatically continue.

The procedure is a bit more complicated if your swap is on an LVM volume
or on software RAID. In this case, instead of passing the 'resume=...' argument,
you should boot the CD as usual and make actions needed for the kernel to see
the swap device (for LVM, that is "vgchange -ay"). After doing that, note
the major and minor device number for that device (assigning persistent numbers
is highly recommended), and echo them to /sys/power/resume. E.g., for LVM:

    # ls -lL /dev/myvg/swap
    brw------- 1 root root 254, 3 2006-07-10 17:51 /dev/myvg/swap
    # echo 254:3 >/sys/power/resume

In the case of the first boot, this will store the device numbers to be used
for hibernation. On the second boot (i.e., after hibernating), this "echo"
command will restore the computer state from the swap device.

AUTOMATING THE BUILD
--------------------

This CD comes with the "jhalfs" tool that allows extracting commands from the
XML version of the LFS or CLFS book into Makefiles and shell scripts. You can
find the jhalfs installation in the home directory of the "jhalfs" user, and
the XML LFS book is in /usr/share/LFS-BOOK-6.3-XML. In order to use jhalfs,
you have to:

 * create a directory for your future LFS system and mount a partition there

 * change the ownership of that directory to the "jhalfs" user

 * run "su - jhalfs" in order to become that user

 * as user "jhalfs", follow the instructions in the jhalfs README file

This user already has the required root access (via "sudo") to complete
the build.

LOADING CD CONTENTS TO RAM
--------------------------

The CD works much faster if you load all its contents to RAM. As a bonus, you
will be able to eject the CD immediately and use the CD-ROM drive for other
purposes (e.g., for watching a DVD while compiling LFS).

To load the CD contents to RAM, type "linux toram" at the boot prompt.

The minimum required amount of RAM is 512 MB. If you have less than 768 MB of
RAM, add swap when the CD boot finishes.

[NOTE]
In order to save RAM, sources and proprietary drivers are not loaded
there. In order to access them, please mount this CD and look into
/media/cdrom/sources and /media/cdrom/drivers.

BOOTING FROM ISO IMAGE
----------------------
If you want to boot this CD on a computer without a CD-ROM drive, follow
the steps below.

Store the ISO image of this CD as a file on a partition formatted with
one of the following filesystems:
vfat, ntfs, ext2, ext3, ext4, jfs, reiserfs, reiser4, xfs

Copy the boot/isolinux/{linux,initramfs_data.cpio.gz} files from the CD
to your hard disk

Configure the boot loader to load "linux" as a kernel image and
"initramfs_data.cpio.gz" as an initrd. The following parameters have to
be passed to the kernel:

    rw root=iso:/dev/XXX:/path/to/lfslivecd.iso rootfstype=fs_type

where /dev/XXX is a partition where you stored the LiveCD image, and
fs_type is the type of the filesystem on that partition. You may
also want to add "rootflags=..." option if mounting this partition requires
special flags.

If there is only Windows on the target computer, please use grub4dos as a boot
loader. It is available from <http://sourceforge.net/projects/grub4dos>.

MAKING A BOOTABLE USB DRIVE
---------------------------

Install GRUB on a flash drive, then follow instructions in the
"BOOTING FROM ISO IMAGE" above, using a partition on your flash drive.
The following tips will ensure that the flash drive is bootable in any
computer:

 * Use the persistent symlink such as "/dev/disk/by-uuid/890C-F46A" to identify
   the target partition.

 * Add "rootdelay=20" to the kernel arguments.

BOOT OPTIONS
------------

### AVAILABLE KERNELS ###

#### linux ####

The default (32-bit on the x86 CD, 64-bit on the x86_64 CD) kernel.

#### linux64 ####

On the x86 CD, this is the alternative (64-bit) kernel, for use with
Cross-Compiled Linux From Scratch <http://trac.cross-lfs.org/>.

Don't use this kernel for building the regular version of LFS -- it will fail,
because the x86 CD does not contain a 64-bit capable compiler, and because
the included book on the x86 CD does not support x86_64 yet.

On the x86_64 CD, this is the same as the default kernel.

After the kernel name, options may be specified, as in the following example:

    linux LANG=ru_RU.UTF-8 TZ=Asia/Yekaterinburg UTC=1

See the list of available options below.

### GRAPHICS AND SOUND ###

#### vga=[resolution] ####

Examples:

    vga=795 (1280x1024x24)   vga=792 (1024x768x24)   vga=789 (800x600x24)
    vga=794 (1280x1024x16)   vga=791 (1024x768x16)   vga=788 (800x600x16)

This parameter enables the framebuffer console.

It has nothing to do with X server resolution (to set it, edit
/etc/X11/xorg.conf manually after booting). Also, it causes some X video
drivers (e.g., "s3virge") to malfunction.

X server bug reports will be ignored if you use this option.

#### volume=[volume] ####

Examples:

    volume=50%
    volume=-15dB

Ths parameter sets the Master, Front and Headphone volume controls on all sound
cards to the specified value. The default is 74%. PCM and similar controls are
always set to 0dB, or, if the driver doesn't know about dB, to 74%.

### DATE AND TIME ###

#### TZ=[timezone] ####

Examples:

    TZ=EDT-4    TZ=America/New_York

The first example means that the timezone is named "EDT"
and is 4 hours behind (west) of UTC.

#### UTC=[0,1] ####

Example:

    UTC=1

Use UTC=1 if the hardware clock is set to UTC or
use UTC=0 (default) if the hardware clock is set to local time.

If no TZ parameter is passed at the kernel command line, the CD asks
for the above settings during boot.

### LOCALIZATION BASICS ###

#### LANG=[locale] ####

Example:

    LANG=fr_FR.UTF-8

If you don't specify your locale at the boot prompt, a configuration dialog
will appear later during boot.

The CD attempts to guess the keymap and the screen font based on the LANG
variable. If the default guess is wrong, you can override it, as described
in the "FINE-TUNING LOCALIZATION" section below.

UTF-8 locales don't work well on Linux text console. Copying and pasting
non-ASCII characters is impossible, as well as using dead keys for entering
characters outside of the Latin-1 range of Unicode.

UTF-8 locales don't work at all with accessibility software (brltty and
speakup) due to the same kernel limitation.

### FINE-TUNING LOCALIZATION ###

#### KEYMAP=[keymap] ####

Example:

    KEYMAP=es+euro1

Specifies the console keymap(s) to load, separated by the "+" sign.

#### LEGACY_CHARSET=[charset] ####

Example:

    LEGACY_CHARSET=iso-8859-15

Instructs the CD to convert an existing keymap from this charset to UTF-8
with the "dumpkeys" program.

#### FONT=[screen_font] ####

Example:

    FONT=LatArCyrHeb-16+-m+8859-15

Specifies the screen font to set (actually, the arguments to the "setfont"
program, separated by the "+" sign).

#### XKEYMAP=[keymap1,keymap2] ####

Example:

    XKEYMAP=us,ru(winkeys)

Keymap(s) for X window system. To switch between them, press Alt+Shift.

### ACCESSIBILITY: BRLTTY ###

#### brltty=drv[,dev[,tbl]] ####

Example:

    brltty=bm,usb:

Enables a refreshable Braille display supported by driver drv, connected to
device dev, with a translation table tbl. The example specifies a BAUM
SuperVario 40 Braille display connected viw USB with default Braille table.

Available drivers:

    al, at, bd, bl, bm, bn, cb, ec, eu, fs, ht, il,
    lt, mb, md, mn, pm, tn, ts, vd, vo, vr, vs.

Available tables:

    brf, cz, da-1252, da-lt, da, de, en_UK, en_US, es,
    fi1, fi2, fr-2007, fr_CA, fr-cbifs, fr_FR, it, nabcc,
    no-h, no-p, pl, pt, ru, se-old, simple, visiob.

The charset of the selected locale must match the charset of the Braille table.

BRLTTY is not compatible with UTF-8 locales.

### ACCESSIBILITY: SPEAKUP ###

#### speakup.synth=[syn] ####

Example:

    speakup.synth=soft

Enables a speech synthesis engine syn. Available drivers: acntpc, acntsa,
appolo, audptr, bns, decext, dectlk, dtlk, keypc, ltlk, soft, spkout, txprt.
The "soft" driver uses Espeak to output sound through the first sound card.

The GIT snapshot of speakup used on this CD has a known bug: copying and
pasting text produces garbage and even can crash the computer. For copying
and pasting text between programs, please use the "screen" terminal emulator
instead of this buggy built-in feature of speakup.

#### speakup.ser=[index] ####

Example:

    speakup.ser=2

One-based serial port index to use with a hardware synth. The example above
means that /dev/ttyS1 will be used.

#### speakup.port=[port] ####

A port address to use with speakup.

### MODULE HANDLING ###

#### load=module1,module2,... ####

Example:

    load=ide-generic

Loads the specified modules unconditionally from initramfs. Use if your SCSI
or IDE controller is not autodetected. If you don't specify this parameter
and the CD doesn't detect your SCSI or IDE controller, you will be dropped
into a debugging shell where you can load the needed module manually.

#### blacklist=module1,module2,... ####

Example:

    blacklist=yenta-socket

Prevents the specified modules from being autoloaded. Use if udev autoloads
a module that causes your computer to misbehave (e.g., crash or freeze).

#### module.option=value ####

Example:

    psmouse.proto=bare

Sets arbitrary module options.

### ALTERNATIVE DRIVERS ###

Options in this section do not take parameters. Example:

    pata new_firewire

#### pata ####

Causes the CD to use new libata-based drivers for IDE controllers. This option
may be required for controller detection or recommended for optimal performance
on computers manufactured in year 2006 and later.

Caution: new drivers are safe to use only with IDE chipsets from AMD, Intel,
ITE, JMicron, Marvell, Netcell, NVIDIA, Serverworks, Promise, Silicon Image,
VIA, or Winbond. Drivers for other chipsets are likely to contain bugs that
lead to data loss.

#### new_firewire ####

Uses the new (experimental) Juju FireWire stack.

#### all\_generic\_ide ####

Attempts to support unknown PCI IDE and SATA controllers (slow).
For SATA support to work with this option, the SATA controller
must be put into "Legacy" (as opposed to "Native") mode in the BIOS.

### TROUBLESHOOTING ###

#### debug ####

Displays kernel messages during the boot process.

#### rootdelay=X ####

Example:

    rootdelay=20

Waits X seconds before attempting to find the CD. Required (with X=20)
for booting from USB or FireWire CD-ROMs.

#### nodhcp ####

Prevents the CD from attempting to obtain an IP address automatically.
May be required for wireless networking, because the WEP or WPA key
needs to be set up first.

#### Options for buggy motherboards ####

Example:

    nomsi noapic nolapic pci=noacpi acpi=off clock=pit ide=nodma

These options work around various chipset bugs. Try them one-by-one in the
order given above and in various combinations if the CD does not boot, or if
a device does not work correctly or fails after hibernating and resuming.
If this helps, the bug is in the hardware or the BIOS, not in this CD.

THANKS
------

Many thanks to all whose suggestions, support and hard work have helped create
this CD.
