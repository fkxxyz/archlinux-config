
[ -f ~/.xprofile ] && . ~/.xprofile

# desktop
caja --force-desktop -n &

# window manager
compiz &
main_pid=$!

# panel
xfce4-panel &

# polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

if [ -d /etc/xdg/autostart ] ; then
 for f in /etc/xdg/autostart/*.desktop ; do
  exo-open "$f"
 done
 unset f
fi

if [ -d ~/.config/autostart ] ; then
 for f in ~/.config/autostart/*.desktop ; do
  [ -x "$f" ] && exo-open "$f"
 done
 unset f
fi

wait $main_pid
