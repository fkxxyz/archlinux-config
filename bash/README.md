

添加颜色配置（修改系统默认）
修改 /etc/skel/.bashrc，添加内容：
```
use_colors=1
if [ "${use_colors}" ]; then
	eval $(dircolors -b)

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
	alias fgrep='fgrep --color=auto'
else
	PS1='[\u@\h \W]\$ '
fi
unset use_colors
```

应用到当前设置
cp /etc/skel/.bashrc ~/.bashrc

