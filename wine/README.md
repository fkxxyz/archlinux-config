## 解决明明安装了 wine-mono 却提示未找到 wine-mono 的问题 ##

此问题产生的原因是 /usr/share/wine/mono 下的 msi 文件名带有版本号，如果 wine 和 wine-mono 的版本不匹配时，就会出现以上情况。常见于更新 wine 后出现，或者用了其它版本如 wine-stable 时出现。

研究发现 /usr/lib/wine/appwiz.cpl.so 这个二进制文件里面包含 /usr/share/wine/mono 下的版本号，那么解决方案就很简单了，提取出此版本号，创建个符号链接指向现有版本的 mono 的 msi 文件即可。

一键代码（普通用户记得加 sudo 给权限）：

```shell
ln -sf $(pacman -Qlq wine-mono|grep 'wine-mono-\([[:digit:].]\+\).msi') /usr/share/wine/mono/$(sed -n 's/.*\(wine-mono-[[:digit:].]\+.msi\).*/\1/p' /usr/lib/wine/appwiz.cpl.so)
```

