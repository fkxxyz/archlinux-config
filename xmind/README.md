
# xmind 配置以 jdk8 启动
从 aur 仓库装了 xmind 之后，如果默认的 java 与 所设置的 xmind 不一致时，会发生错误启动不了。故需要如下修改：  
编辑 /usr/bin/XMind
在第二行加入
```
PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH
```
然后尝试启动，如果不行，则将其中的 8 改成 10 再次尝试。
