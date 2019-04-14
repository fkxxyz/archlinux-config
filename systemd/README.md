
减少开关机等待
修改  /etc/systemd/system.conf ，如下两行
```
DefaultTimeoutStartSec=15s
DefaultTimeoutStopSec=15s
```

启动时不清屏
在/etc/systemd/system/getty@tty1.service.d/noclear.conf写入：
```
[Service]
TTYVTDisallocate=no
```


