
# openbox 配置
## 将 openbox 设为所有用户 xfce4 的默认窗口管理器
```
sed -i 's/value="xfwm4"/value="openbox"/g' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
```
写入 hook 使重装升级不失效：
新建 /etc/pacman.d/hooks/openbox-xfce4-session.hook ，写入：
```
[Trigger]
Type = File
Operation = Install
Operation = Upgrade
Target = etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml

[Action]
Description = Set openbox as the default window manager...
When = PostTransaction
Exec = /usr/bin/sed -i 's/value="xfwm4"/value="openbox"/g' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml

```

## 修改默认的 alt+鼠标键，因为这可能与某些程序冲突。
安装并运行一次 openbox设置程序
```
pacman -S obconf
obconf
```
修改 ~/.config/openbox/rc.xml
寻找 "A-Left" ，将所有的 A-Left 改为 W-Left
寻找 "A-Right" ，将所有的 A-Right 改为 W-Right
重启 openbox 生效
同理修改 /etc/xdg/openbox/rc.xml 可以使所有用户生效

## 设置自动启动项
在 /etc/xdg/openbox/autostart 中写入启动项即可，注意要加 & 后台执行
```
# 自动启用窗口混合（支持透明）
xcompmgr &

# 启用输入法
fcitx &

# 启动 conky
conky &

# 启动 xfce4-panel
xfce4-panel &
```
