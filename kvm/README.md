# 此为我的 kvm 配置

安装所有所需的包
```
pacman -S qemu # 机器模拟器
pacman -S libvirt # kvm 管理器
pacman -S virt-manager # kvm 图形前端pacman -S 
pacman -S virtio-win # win 系统驱动
pacman -S ovmf # qemu UEFI固件
pacman -S ebtables # 防火墙
```

在 /usr/local/bin/skvm 中写入
```
#!/bin/bash
modprobe -a virtio virtio-net virtio-blk virtio-scsi
systemctl start libvirtd
systemctl start virtlogd
```
在 /usr/local/bin/kkvm 中写入
```
#!/bin/bash
systemctl stop libvirtd
systemctl stop virtlogd
rmmod virtio-net virtio-blk virtio-scsi virtio
```
设置可写权限
```
chmod +x /usr/local/bin/*kvm
```
