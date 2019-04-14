# NetworkManager网络配置

启动网络管理器服务
```
systemctl start NetworkManager
```

将此服务设为自动启动
```
systemctl enable NetworkManager
```

查看网络概况
```
nmcli
nmcli -overview
```

打开关闭总网络开关
```
nmcli n on/off
nmcli network on/off
```

查看网络设备状态
```
nmcli d
nmcli device
nmcli device status
```

查看网络设备详细信息
```
nmcli d sh
nmcli device show
nmcli device show eth0
```

连接/断开设备
```
mncli d conn/dis eth0
mncli device connect/disconnect eth0
```

删除软件设备
```
nmcli d del 
```

监控某个设备的连接过程
```
nmcli d mon eth0
nmcli d monitor eth0
```

设置某个设备自动连接
```
nmcli d set eth0 auto yes/no
```

设置某个设备是否本程序管理
```
nmcli d set eth0 man yes/no
```

配置某个设备（暂时的，重启失效）
```
nmcli d mod eth0 ??
```

让某个设备重新应用
```
mncli d re eth0
```

查询wifi
```
nmcli d wifi
nmcli d wifi list
nmcli d wifi list ifname wlp3s0
```

刷新wifi
```
nmcli d wifi rescan
nmcli d wifi rescan ifname wlp3s0
```

连接wifi
```
nmcli d wifi <SSID> password <password>
nmcli d wifi <SSID> password <password> ifname wlp3s0
```



查看所有配置
所有配置文件保存在 /etc/NetworkManager/system-connections
```
nmcli c
nmcli c show
```

删除某个配置
```
nmcli c del <name>
```

复制某个配置
```
nmcli c clone <name> <new_name>
```

连接/断开某个配置
```
nmcli c up/down <name>
```

重新载入配置文件
```
nmcli c reload
```

导入/导出配置文件
```
nmcli ??
```

监视某个配置
```
nmcli c mon <name>
```

修改某个配置的某一行
```
nmcli c mod <name> <配置>.<属性> <值>
```

启动编辑某个配置
```
nmcli c edit <name>
```

创建配置
```
nmcli c add con-name <name> type ??? ...
```

创建pppoe拨号配置
```
nmcli c add con-name <name> type pppoe ifname <设备> username <username> password <password>
```
