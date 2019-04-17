
# shadowsocksr配置
安装 privoxy 、 shadowsocksr 和 ssr2json
```
yaourt -S privoxy shadowsocksr ssr2json
```
添加订阅地址（如果长时间无反应，则按 ctrl+c 并再次执行一次）
```
ssrctl sub add <订阅地址>
```
添加 ssr 节点
```
ssrctl node add <ssr链接>
```
列出所有的节点（以下四个命令均可）
```
ssrctl
ssrctl n
ssrctl node
ssrctl node list
```
连接指定节点（会复制json文件到 /etc/shadowsocksr/default.json）
```
ssrctl node connect <序号>
ssrctl node connect <json配置文件完整路径>
```
设置 shadowsocksr 自动启动
```
systemctl enable shadowsocksr@default
```
查看服务连接状态（绿色的 active 则为成功）
```
systemctl enable shadowsocksr@default
```
测试连接（执行成功则会返回节点的地址，提示错误则失败，可尝试换节点）
```
curl --socks5 127.0.0.1:1080 ip.sb
```

# 配置 privoxy，利用环境变量进行代理
编辑  /etc/privoxy/config # 注意第一行最后有个点 '.'
```
forward-socks5   /               127.0.0.1:1080 .
listen-address localhost:8118
```
启动 privoxy
```
systemctl start privoxy
```
编写脚本方便使用
新建 /usr/local/bin/prun 写入：
```
#!/bin/bash
export http_proxy=http://127.0.0.1:8118/
export https_proxy=https://127.0.0.1:8118/
export ftp_proxy=ftp://127.0.0.1:8118/
exec $*
```
添加可执行权限
chmod +x /usr/local/bin/prun
用法： 需要走代理的命令前加 prun 即可
```
prun curl ip.sb
prun chromium # 可换成自己的浏览器
```
让当前终端生效
```
. prun
curl ip.sb
chromium # 可换成自己的浏览器
```

# 谷歌浏览器插件代理
安装 SwitchyOmega 插件
将情景模式设置如下：  
代理协议  socks5  
代理服务器  127.0.0.1  
代理端口  1080  
保存退出，浏览网页，然后右上角点击该插件切换此情景模式即可

