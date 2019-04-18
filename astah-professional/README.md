
# astah-professional

修改 /usr/lib/astah_professional/astah-pro
在其中 java 启动前加入如下行，即可无限试用：
```
$(cd ~/.astah/professional&&date +%Y/%m/%d>ael&&gzip -f ael&&mv -f ael.gz .ael)
```

astah-professional 只能以 java8 或者以前的版本能用，修改 /usr/lib/astah_professional/astah-pro ，加入用 java8 启动 ：

```
PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH
```
