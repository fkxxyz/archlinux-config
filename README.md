# 此仓库为我大多数软件的 archlinux 基本配置

## 以下为基本配置


## 设置键盘布局
列出所有可用的键盘布局

```
ls /usr/share/kbd/keymaps/**/*.map.gz
```
设置想要的键盘布局（默认 us，只需指定文件名即可，无需拓展名）
loadkeys us
设置键盘布局
写入文件 /etc/vconsole.conf

```
KEYMAP=us
```


## 设置时区

```
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

## 设置系统时间
（以下两个二选一）
将硬件时间设置为系统的本地时间（与windows默认相同）

```
hwclock -s -l
```

将硬件时间设置为系统的UTC时间（与mac系统默认相同）
```
hwclock -s -u
```

启用 ntp 服务，获取网络时间并设置为当前系统时间

```
timedatectl set-ntp true
```

生成时间偏差（/etc/adjtime）

```
hwclock -w
```


## 设置本地语言
修改 /etc/locale.gen，去除en_US.UTF-8和zh_CN.UTF-8前面的井号

```
locale-gen
echo LANG=en_US.UTF-8 >/etc/locale.conf
```


## 修改主机名

```
hostnamectl set-hostname ???
```
在 /etc/hosts 里添加（设置网络主机名）

```
127.0.0.1          localhost
::1                localhost
127.0.1.1          ???.localdomain ???
```


## 用户管理
设置 root 用户的密码

```
passwd root
```
创建新用户

```
useradd -m ???
```


## sudo
将 /etc/sudoers 中 %wheel 前面的 去掉

将某用户设成管理员（能够用sudo）

```
usermod -G wheel ???
```

## 配置软件源
参见：  
[Arch Linux 软件仓库镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/archlinux/)  
[ArchlinuxCN 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/archlinuxcn/)  


更新软件数据库

```
pacman -Syy
```
更新系统

```
pacman -Syu
```

开启别的仓库只需要取消注释 /etc/pacman.conf 相应的项


