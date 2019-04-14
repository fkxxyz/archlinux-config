

复制 oh-my-zsh 的配置
```
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc
```

查看所有主题
```
ls /usr/share/oh-my-zsh/themes/
```

设置默认主题
修改  ~/.zshrc
将 ZSH_THEME="robbyrussell" 中引号内容改为自己想要的主题，如 ys

修改默认shell为zsh
```
chsh -s /bin/zsh
```
重新登录生效
