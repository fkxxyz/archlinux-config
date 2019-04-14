
## 禁用响铃
暂时生效
```
rmmod pcspkr
```
永久生效
```
echo blacklist pcspkr>>/etc/modprobe.d/nobeep.conf
```

禁用n显卡开源驱动（此驱动bug过多，可能导致死机）
在 /etc/modprobe.d/no-nouveau.conf 中写入：
```
blacklist nouveau
options nouveau modeset=0
```

禁用蓝牙（可选，长期不用禁了省电）
```
find /lib/modules/`uname -r`/kernel -name bluetooth|xargs find|grep \.xz$|awk -F'/' '{print $NF}'|awk -F'.' '{print "blacklist " $1}' >>/etc/modprobe.d/no-bluetooth.conf
```


用查看 wifi 的 rf锁
```
rfkill list
```
解除 rf 锁
```
rfkill unlick all
```

