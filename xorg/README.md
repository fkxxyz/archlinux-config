
# xorg 配置

参照[官方wiki的xorg](https://wiki.archlinux.org/index.php/Xorg)配置

## 安装驱动

```shell
pacman -S xf86-video-intel
```

## 设置驱动

在 /etc/X11/xorg.conf.d/20-intel.conf 写入

```
Section "Device"
   Identifier  "Intel Graphics"
   Driver      "intel"
EndSection
```

然后 startx 测试