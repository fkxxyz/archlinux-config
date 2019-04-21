
立即锁屏
```
light-locker-command -l
```

设置为当前用户的 xfce4 默认锁屏
```
xfconf-query -c xfce4-session -p /general/LockCommand -s "light-locker-command -l" --create -t string
xfconf-query -c xfce4-session -p /general/LockCommand -s "light-locker-command -l"
```

设置为所有用户的 xfce4 默认锁屏
```
sed '/name="sessions"/a\ \ \ \ <property name="LockCommand" type="string" value="light-locker-command -l"/>' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
```
但重装 xfce4-session 会覆盖此修改的文件，为了使重装 xfce4-session 也仍然有效，把这条命令写入安装的 hook :
新建 /etc/pacman.d/hooks/light-locker-xfce4-session.hook ，写入：
```
[Trigger]
Type = File
Operation = Install
Operation = Upgrade
Target = etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml

[Action]
Description = Set light-locker as the default locker...
When = PostTransaction
Exec = /usr/bin/sed -i '/name="sessions"/a\ \ \ \ <property name="LockCommand" type="string" value="light-locker-command -l"/>' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml

```

