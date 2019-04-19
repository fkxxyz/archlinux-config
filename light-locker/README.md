
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
修改 /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml ，将 general 属性中添加一个属性 LockCommand ，如下：
```
  <property name="general" type="empty">
    <property name="FailsafeSessionName" type="string" value="Failsafe"/>
    <property name="LockCommand" type="string" value="light-locker-command -l"/>
  </property>
```

