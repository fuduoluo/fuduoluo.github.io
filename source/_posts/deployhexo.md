---
title: 部署Hexo博客-阿里云

top_img: 'https://ae01.alicdn.com/kf/U1707cec45ca84f7b824264cd722e3fd08.jpg'
comments: true
top: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: 'https://ae01.alicdn.com/kf/U1707cec45ca84f7b824264cd722e3fd08.jpg'
tags: blog aliCloud nginx
categories: Linux Hexo 
keywords: 迁移博客 部署 服务器 hexo
description: 打造属于自己博客，部署到阿里云~~
abbrlink: d99eadeb
date: 2020-12-21 23:38:55
updated: 2020-12-21 23:38:55
---

<blockquote class="blockquote-center">
由于购买的服务器时间快到了，一直没有利用起来，所以博客也是放了好久才弄到自己的服务器上面来。
就在昨晚-20.12.21 终于搞定了！！
由于本地之前已经有搭建完成过，并部署到Github,所以本地方面搭建的就进行忽略.....
</blockquote>

<p id="div-border-top-blue">
服务器选择是：CentOS 8.1.1911 ESC-共享版
<br>
域名选择是：阿里云注册备案
<br>
大致步骤：<br> 安装必要软件-[git,node等] <br> 搭建远程仓库 <br> 配置NGINX访问和域名映射 <br> 更改hexo配置文件 <br> hexo deploy 部署发布
</p>

#### 本地服务搭建

{% note primary flat flat%}
[参看：本地搭建流程](https://zhuanlan.zhihu.com/p/137022058)
[参看：本地搭建流程](https://zhuanlan.zhihu.com/p/126243913)
{% endnote %}

#### 远程服务搭建

<span id="inline-yellow">域名注册备案</span>

- [阿里云域名注册](https://mi.aliyun.com/?spm=5176.13910061.1158119.3.79f13f8bVWD9lf)
- [阿里云域名备案](https://beian.aliyun.com/?spm=5176.17702883.J_8058803260.1303.77d12c4fsMT6wQ)

<span id="inline-yellow">域名解析映射到服务器</span>

![点击进入解析管理](https://p.pstatp.com/origin/137350002af5681356bfe)
![点击修改进行配置](https://p.pstatp.com/origin/1384f0000fa50b6386b8b)

<span id="inline-yellow">安装NGINX等服务</span>

- 强烈建议使用安塔进行安装
- 新手可避免Linux遇到问题
- 一键安装升级省去很多麻烦

<span id="inline-yellow">迁移Hexo--搭建私有Git库</span>

{% note success flat %}
安装Git 查看版本号
{% endnote %}

```
# yum install git
# git --version
```

{% note success flat %}
安装node.js 查看版本号
{% endnote %}

```
# cd ~
# curl -sL https://rpm.nodesource.com/setup_10.x | bash -
# yum install -y nodejs
#node -v
#npm -v

```

{% note success flat %}
创建git用户并配置仓库
{% endnote %}

```
useradd git  #创建git用户

chmod 740 /etc/sudoers #修改git权限

vim /etc/sudoer #打开文件添加git用户
------
找到 root ALL=(ALL) ALL，在下面添加一行 git ALL=(ALL) ALL
------

chmod 400 /etc/sudoers #修改回文件权限
sudo passwd git      # 设置密码
su git          # 这步很重要，不切换用户后面会很麻烦

cd /home/git/
mkdir -p projects/blog # 项目存在的真实目录
mkdir repos && cd repos
git init --bare blog.git # 创建一个裸露的仓库
cd blog.git/hooks

```


{% note success flat %}
本地配置ssh连接远程端[-给git用户配置ssh免密公钥登录-]----难点
{% endnote %}

<span id="inline-yellow">本地操作</span>

```
$cd ~  #切换用户目录
$cd .ssh #进入C盘.ssh--本地可能会隐藏这个文件 记得开启
$ssh-keygen # 本地生成公钥和私钥对---一路回车下去
$ chmod 700 ~/.ssh #本地计算机设置私钥权限
$ chmod 600 ~/.ssh/id_rsa #本地计算机设置私钥权限
```
- 上传到服务器端-使用FTP工具或者是宝塔上传
![参考](https://pic4.zhimg.com/80/v2-8693826b15098785946437346faf502b_720w.jpg)

<span id="inline-yellow">服务端操作</span>

##### 上传完成后切回服务器端，继续以git用户的身份进入服务器\~/.ssh目录，新建一个authorized_keys文件，并将id_rsa.pub文件中公钥的内容拷贝到该文件中。 （注：该步骤既可以用命令行操作，也可使用FTP工具操作

```
$cd ~/.ssh
$cp id_ras.pub authorized_keys
$cat id_ras.pub >> ~/.ssh/authorized_keys
```
##### 服务端设置文件权限

```
$chmod 600 ~/.ssh/authorized_keys
$chmod 700 ~/.ssh
```
##### 确保设置了正确的SELinux上下文。

```
$ restorecon -Rv ~/.ssh
```
##### 本地测试是否可以连接到远程服务器

```
$ssh -v git@xxx.xxx.xxx.xxx（阿里云公网IP）#法1
$ssh git@xxx.xxx.xxx.xxx（阿里云公网IP）#法2
```

![本地连接参考](https://pic1.zhimg.com/80/v2-b5b4e218ee839ccd1f9c150a07d46160_720w.jpg)


{% note success flat %}
配置服务端Git仓库-配置完成后进行重启
{% endnote %}

```
#在服务器上使用git用户创建一个Git仓库，并且在该仓库中新建一个post-receive钩子文件

$cd ~
$git init --bare hexo.git
$vi ~/hexo.git/hooks/post-receive

#让钩子文件删除/home/www/hexo目录下原有的文件，然后从blog.git仓库 clone 新的博客静态文件到/home/www/hexo目录下
------
git --work-tree=/home/www/hexo --git-dir=/home/git/hexo.git checkout -f
------

#授予钩子文件可执行权限

$chmod +x ~/hexo.git/hooks/post-receive
$cd ~
$sudo chmod -R 777 /home/www/hexo
```
{% note success flat %}
测试 Git 仓库是否可用
{% endnote %}

```
git clone git@server_ip:/home/git/hexo.git
```

{% note success flat %}
修改hexo配置文件,部署到阿里云
注意：root需要配置正常，以防上传的后css丢失
{% endnote %}

```
deploy:
  - type: git
    repository: git@xxx.xxx.xxx.xxx:/home/git/hexo.git
    branch: master
```


{% note danger flat %}
配置Ningx注意点:
{% endnote %}
<span id="inline-yellow">配置完成域名映射和git仓库后一直访问失败</span>

![建立站点](https://ae01.alicdn.com/kf/U2a5effabe275493694d92cfafc31df0cm.jpg)

![更改配置文件](https://ae01.alicdn.com/kf/U603267c072d8404ead4ea7264ce12a2bc.jpg)

<span id="inline-yellow">参考链接</span>
[到站了还不下车](https://zhuanlan.zhihu.com/p/126243913)
[morooi](https://morooi.cn/2020/toaliyun/)