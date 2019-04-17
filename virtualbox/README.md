
# virtualbox 配置

禁止驱动自动加载
在 /etc/modprobe.d/disable_vbox.conf 中写入：
```
blacklist vboxdrv
blacklist vboxnetadp
blacklist vboxnetflt
blacklist vboxpci
blacklist vboxsf
blacklist vboxguest
```

在 /usr/local/bin/svbox 中写入
```
#!/bin/bash
modprobe -a vboxdrv vboxguest vboxnetflt vboxnetadp vboxsf vboxpci
```

在 /usr/local/bin/kvbox 中写入
```
#!/bin/bash
rmmod vboxsf vboxpci vboxnetadp vboxnetflt vboxguest vboxdrv
```

添加可执行权限
```
chmod +x /usr/local/bin/*vbox
```


