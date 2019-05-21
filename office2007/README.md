# linux 发行版下用 wine 安装office2007的教程

## 下载 office2007 的官方 iso 光盘镜像
个人推荐亲测可用的 office2007 镜像 http://www.songyongzhi.com/Office2007.html

## 安装 wine
各大发行版安装 wine 的方法不同，可以自己百度或谷歌其安装方法。下面介绍 archlinux 和 deepin 两个的发行版安装 wine 的方法。

### archlinux 发行版中安装 wine
启用 multilib 仓库，编辑 /etc/pacman.conf，取消下面内容的注释，此步骤详见官方wiki  
https://wiki.archlinux.org/index.php/Official_repositories_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#multilib

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

然后使用包管理器安装 wine

```
sudo pacman -S wine
```

-

### deepin 发行版中安装 wine
直接使用包管理器安装 wine 即可

```
sudo apt-get install wine
```


## 验证 wine 是否安装成功
终端中执行 wine，如果提示以下信息，则代表安装成功

```
Usage: wine PROGRAM [ARGUMENTS...]   Run the specified program
       wine --help                   Display this help and exit
       wine --version                Output version information and exit
```

## 安装 winetricks
对于archlinux，官方仓库有winetrices所以能直接安装，直接执行 sudo pacman -S winetricks 即可

对于其他发行版，可以手动下载安装

```
# 下载仓库
wget https://github.com/Winetricks/winetricks/archive/master.zip

# 解压仓库
unzip master.zip

# 进入仓库目录
cd winetricks-master

# 安装到系统
sudo make install

# 清理刚刚下载、解压的文件
cd ..
rm -r winetricks-master
rm master.zip
```

检验 winetricks 是否安装成功

```
winetricks --help
```
显示出很多帮助信息，则安装成功。

## 建立一个自定义的 office2007 的 wine 容器
在家目录中随便找个位置用于保存 office2007 的容器安装目录，下面以 ~/wine/office2007 为例

```
# 设置 wine 的环境变量
WINEPREFIX=~/wine/office2007
WINEARCH=win32

# 建立容器目录
winecfg
```
在弹出的 wine设置中，最好将 windows 版本设置成 Windows XP，然后点确定

开始用 winetrick 安装 office2007

```
# 挂载安装光盘，注意把下载好的iso文件替换成你实际下载好的路径
sudo mount <下载的iso文件路径> /mnt

# 开始安装 office2007
winetricks office2007pro
```
在弹出的安装界面中可以像 windows 下一样一步一步正常安装，注意要点  
1. 许可协议中方块字体可以不用管，不影响后续使用。  
2. 安装过程中注意挑选自己安装的组建即可，一般只勾选三件套 word excel ppt 以及公共的共享功能和工具。  
3. 安装路径默认 C:\Program Files\Microsoft Office 即可，会自动映射到你前面所设置的 wine 容器目录中。
4. 一般情况下装装完之后，应用菜单列表中即可启动正常使用office。

## 后续需要的设置
在 word 中输入法可能不能正常使用，如果遇到此情况，打开 word 选项--高级--输入法控制处于活动状态勾勾打上

## 关于字体
linux 里面是没有 windows 字体的，这会导致很多方块现象和想用的字体没有的情况。需要导入 windows 字体才可以正常使用 windows 字体。  
如果你目前装有现成的 windows 系统，可以从 windows 字体目录中复制到 linux 直接使用。  
*注： windows 的字体在 windows 分区下 Windows/fonts 里面，linux 的字体在 /usr/share/fonts 里面，只需要复制所有的 ttf 格式字体即可*

```
# 任意在 /usr/share/fonts 下建立一个子目录
sudo mkdir -p /usr/share/fonts/windows

# 将 windows 字体复制过来
sudo cp <windows分区挂载点>/Windows/fonts/*.ttf /usr/share/fonts/windows

# 更新字体缓存
cd /usr/share/fonts/windows
sudo mkfontscale
sudo mkfontdir
sudo fc-cache 
```
重启 office 生效






