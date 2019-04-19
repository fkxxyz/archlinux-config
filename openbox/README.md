
# openbox 配置
## 将 openbox 设为 xfce4 的默认桌面
修改 /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml ，寻找xfwm4 ，将其改为 openbox
```
      <property name="Client0_Command" type="array">
        <value type="string" value="openbox"/>
      </property>
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

## 启用窗口混合（支持透明）
安装 xcompmgr 将其设为自动启动

