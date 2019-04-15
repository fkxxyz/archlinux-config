
立即锁屏
```
light-locker-command -l
```

设置为 xfce4 默认锁屏
```
xfconf-query -c xfce4-session -p /general/LockCommand -s "light-locker-command -l" --create -t string
xfconf-query -c xfce4-session -p /general/LockCommand -s "light-locker-command -l"
```
