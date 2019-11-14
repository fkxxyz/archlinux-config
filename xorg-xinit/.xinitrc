
[ -f ~/.xprofile ] && . ~/.xprofile

# deamon process
mkdir -p /tmp/xinitrc_sleep_deamon_$USER
cp -f /usr/bin/sleep /tmp/xinitrc_sleep_deamon_$USER/xinitrc_sleep_deamon_$USER
/tmp/xinitrc_sleep_deamon_$USER/xinitrc_sleep_deamon_$USER 3650000d &
main_pid=$!
echo $main_pid > /tmp/xinitrc_sleep_deamon_$USER/pid
export > /tmp/xinitrc_sleep_deamon_$USER/env
echo 'exec "$@"' >> /tmp/xinitrc_sleep_deamon_$USER/env
chmod +x /tmp/xinitrc_sleep_deamon_$USER/env

# window manager
compiz &

# panel
lxpanel &

# desktop
pcmanfm --desktop &

# polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

if [ -d /etc/xdg/autostart ] ; then
 for f in /etc/xdg/autostart/*.desktop ; do
  exo-open "$f" &
 done
 unset f
fi

#caja --force-desktop -n &

if [ -d ~/.config/autostart ] ; then
 for f in ~/.config/autostart/*.desktop ; do
  [ -x "$f" ] && exo-open "$f" &
 done
 unset f
fi

wait $main_pid


