#!/usr/bin/perl
use strict;
use warnings;

my $lang = $ARGV[0];
$lang =~ s/.*xml.?// ;

local $/;
open(FH, "<$ARGV[0]");
my $content = <FH>;
close FH;

# Translate "Xfce Menu" to the given language, present the result as UTF-8
my $xfcemenu = `LC_ALL=en_US.UTF-8 LANGUAGE=$lang TEXTDOMAIN=xfdesktop gettext \"Xfce Menu\"`;

# Test whether the translated menu file exists
my $menufile = "/etc/xdg/xfce4/desktop/menu.xml.$lang";
$menufile = "/etc/xdg/xfce4/desktop/menu.xml" unless -e $menufile;

my $menuentry = "    <Group>\n      <Control id=\"-1\" filename=\"libdesktopmenu.so\" use_default_menu=\"1\" menu_file=\"$menufile\" icon_file=\"/usr/share/pixmaps/xfce4_xicon1.png\" show_menu_icons=\"1\" button_title=\"$xfcemenu\"/>\n    </Group>";

# Add this entry as the first panel icon
$content =~ s,<Groups>,<Groups>\n$menuentry,g;

# Remove popup menus related to Konqueror etc.
$content =~ s,<Popup>.*?</Popup>,<Popup/>,sg;
$content =~ s,popup="1",popup="0",g;

# Use SeaMonkey for web and mail
$content =~ s,Mozilla,SeaMonkey,g;
$content =~ s,mozilla,/bin/sh -c 'mozilla -remote "xfeDoCommand(openBrowser)" 2&gt;/dev/null || mozilla',g;

# Hide the non-functional "Lock Screen" button
$content =~ s,button1=".",button1="1",g;
$content =~ s,button2=".",button2="0",g;
$content =~ s,showtwo=".",showtwo="0",g;

# Remove non-functional buttons related to multimedia and printing.
# Hack. Works for now, but may break in the future. Check with:
# for a in contents.xml* ; do grep --count Group $a ; done
# Should print the same number for all files.

$content =~ s,<Group>[^G]*?xfprint4.*?</Group>\s*,,sg;
$content =~ s,<Group>[^G]*?xmms.*?</Group>\s*,,sg;

# Hide the mail icon because of the profile locking problem,
# and because its text isn't looked up for translations
$content =~ s,<Group>[^G]*?libmailcheck.*?</Group>\s*,,sg;

# End of hack

open(FH, ">$ARGV[0]");
print FH $content;
close FH;
