

安装英伟达显卡驱动（如果显卡较老加载不成功则可尝试nvidia-390xx、nvidia-340xx，更老则可搜索aur里的驱动安装）
```
pacman -S nvidia
```

32位程序程序使用英伟达显卡驱动支持
```
pacman -S lib32-nvidia-utils
```

尝试加载驱动（不成功则卸载装别的驱动）
```
modprobe nvidia nvidia_uvm nvidia_drm nvidia_modeset
```

查看驱动是否在运行（有输出代表成功运行）
```
lsmod | grep nvidia
nvidia-smi
```

查看显卡所有信息
```
nvidia-smi -q
```

安装显卡驱动开关
```
pacman -S bbswitch
```
加载显卡驱动开关
```
modprobe bbswitch
```
开
```
tee /proc/acpi/bbswitch <<< ON
```
关
```
tee /proc/acpi/bbswitch <<< OFF
```
查看开关
```
cat /proc/acpi/bbswitch
```

安装配置双显卡切换器
```
pacman -S bumblebee
sudo usermod -a -G bumblebee
```
修改 /etc/bumblebee/bumblebee.conf :
```
Driver=nvidia
[driver-nvidia]
PMMethod=bbswitch
```

测试英伟达显卡驱动（不加optirun为测试集显，终端输出了显卡型号，以后用optirun运行程序则表示使用英伟达显卡）
```
optirun glxspheres64
optirun glxspheres32
```
