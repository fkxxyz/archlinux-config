
## 设置无限试用
编辑 /usr/bin/bcompare ，在其中启动主程序前加一行：
```
rm -f ~/.config/bcompare/registry.dat
```
