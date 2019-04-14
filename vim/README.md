
禁用 vim 的 mouse 模式
编辑 /etc/skel/.vimrc 添加
```
if has( 'mouse' )
    set mouse-=a
endif
```
