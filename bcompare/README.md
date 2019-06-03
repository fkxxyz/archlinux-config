
## 设置无限试用
编辑 /usr/bin/bcompare ，在其中启动主程序前加一行：

```
rm -f ~/.config/bcompare/registry.dat
```

## 永久生效
编写 PKGBUILD 添加 hook

```
pkgname=bcompare-crack-patch
pkgver=1
pkgrel=0
arch=('any')
url='http://www.scootersoftware.com'
license=('GPL3')

package(){
  install -d "$pkgdir/usr/share/libalpm/hooks"
echo "[Trigger]
Type = File
Operation = Install
Operation = Upgrade
Target = usr/bin/bcompare

[Action]
Description = Patch bcompare...
When = PostTransaction
Exec = /usr/bin/sed -i '2s/^/rm -f ~\/.config\/bcompare\/registry.dat\\n/' /usr/bin/bcompare
" > "$pkgdir/usr/share/libalpm/hooks/bcompare-crack-patch.hook"
}
```


