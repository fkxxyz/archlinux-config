
[ -f ~/.xprofile ] && . ~/.xprofile

# deamon process
cp -f /usr/bin/sleep /tmp/xinitrc_sleep_deamon_$USER
/tmp/xinitrc_sleep_deamon_$USER 3650000d &
main_pid=$!
echo $main_pid > /tmp/xinitrc_sleep_deamon_$USER.pid

# window manager
compiz &

# polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# panel
xfce4-panel &

if [ -d /etc/xdg/autostart ] ; then
 for f in /etc/xdg/autostart/*.desktop ; do
  exo-open "$f"
 done
 unset f
fi

# desktop
caja --force-desktop -n &

if [ -d ~/.config/autostart ] ; then
 for f in ~/.config/autostart/*.desktop ; do
  [ -x "$f" ] && exo-open "$f"
 done
 unset f
fi

wait $main_pid

autorun.sh stop

