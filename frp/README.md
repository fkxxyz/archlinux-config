
# frpc 配置
在 /etc/frp/frpc.ini 中写入

```
[common]
server_addr = 123.123.123.123  # 服务器地址
server_port = 7000  # 服务器端口
token = qwertyui  # 密码

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 10022
```

启动服务
```
systemctl start frpc
```
启动服务后在其他机子上执行 ssh 测试（需要加端口选项 -p 10022）

设置自动启动
```
systemctl enable frpc
```


