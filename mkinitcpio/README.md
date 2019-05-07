
## 优化 initramfs（大幅度增加开机启动速度）

```
cd /etc/mkinitcpio.d
cp linux.preset linux-o.preset
```
编辑 linux-o.preset  
mkinitcpio.conf 改成 mkinitcpio-o.conf  
initramfs-linux.img 改成 initramfs-linux-o.img  
去掉 fallback

```
cd ..
cp mkinitcpio.conf mkinitcpio-o.conf
```

编辑 mkinitcpio-o.conf  
MODULES中加入sd_mod ahci ext4 atkbd i8042  
HOOK中只保留 base  
如果启动不成功，重启进官方的initramfs用lsmod查看
需要哪些模块，然后将这些模块求出启动所需最小子集，加入MODULE。  

生成优化版 initramfs

```
mkinitcpio -p linux-o
```
修改引导，使用新生成的/boot/initramfs-linux-o.img引导系统

更新内核时自动生成优化版的 initramfs
新建 /etc/pacman.d/hooks/linux-o.hook 写入

```
[Trigger]
Type = File
Operation = Install
Operation = Upgrade
Target = boot/vmlinuz-linux
Target = usr/lib/initcpio/*

[Action]
Description = Updating linux-o initcpios...
When = PostTransaction
Exec = /usr/bin/mkinitcpio -p linux-o

```
