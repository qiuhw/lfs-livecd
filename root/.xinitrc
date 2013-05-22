# For languages that can't be displayed on Linux console, we have, e.g.:
# LC_ALL=C, LANG=zh_CN.UTF-8
# Remove LC_ALL now so that LANG takes effect
unset LC_ALL

if xrandr | grep -q '\*0.*640 x 480.*\*60'
then
	BAD_RESOLUTION="640 x 480"
fi
if xrandr | grep -q '\*0.*800 x 600.*\*60'
then
	BAD_RESOLUTION="800 x 600"
fi

if [ -n "$BAD_RESOLUTION" ]
then
xmessage -center \
"The X server could not obtain the allowed synchronization
frequencies from the monitor because your monitor is not
Plug-n-Play compatible.  Thus, a default resolution of
$BAD_RESOLUTION @ 60 Hz has been used.  This can hurt your eyes.

To fix the problem, press Ctrl + Alt + Backspace, and then
specify the allowed frequency ranges in /etc/X11/xorg.conf
manually.  See /root/README.txt for details.

If $BAD_RESOLUTION @ 60 Hz is indeed what you want, press the 'okay'
button to proceed."
fi
scim -d
exec startxfce4
