---
title: Linux备忘录
permalink: 'posts/:abbrlink.html'
top_img: https://user-gold-cdn.xitu.io/2018/7/3/1645efa7048fd018?imageView2/0/w/1280/h/960/format/webp/ignore-error/1
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://user-gold-cdn.xitu.io/2018/7/3/1645efa7048fd018?imageView2/0/w/1280/h/960/format/webp/ignore-error/1
abbrlink: 59c3cb02
date: 2020-06-28 23:31:38
updated: 2020-06-28 23:31:38
tags: Linux
categories: Linux
keywords: Linux
description: Linux笔记
---

### Linux修改用户名主机名

{% note primary %}
$ sudo vi /etc/hostname 
laputcat
$ sudo vi /etc/hosts
127.0.0.1       localhost
127.0.1.1       laputcat
{% endnote %}
{% note danger %}
记得重启Linux
{% endnote %}

{% note info %}
重启命令：
1、reboot
2、shutdown -r now 立刻重启(root用户使用)
3、shutdown -r 10 过10分钟自动重启(root用户使用)
4、shutdown -r 20:35 在时间为20:35时候重启(root用户使用)
如果是通过shutdown命令设置重启的话，可以用shutdown -c命令取消重启

关机命令：
1、halt   立刻关机
2、poweroff  立刻关机
3、shutdown -h now 立刻关机(root用户使用)
4、shutdown -h 10 10分钟后自动关机
如果是通过shutdown命令设置关机的话，可以用shutdown -c命令取消重启
{% endnote %}

### linux下载软件安装的位置

{% note warning %}
/usr：系统级的目录，可以理解为C:/Windows/。

/usr/lib理解为C:/Windows/System32。

/usr/local：用户级的程序目录，可以理解为C:/Progrem Files/。用户自己编译的软件默认会安装到这个目录下


/opt：用户级的程序目录，可以理解为D:/Software，opt有可选的意思，这里可以用于放置第三方大型软件（或游戏），当你不需要时，直接rm -rf掉即可。在硬盘容量不够时，也可将/opt单独挂载到其他磁盘上使用。

源码放哪里？
/usr/src：系统级的源码目录。
/usr/local/src：用户级的源码目录。

/opt

这里主要存放那些可选的程序。你想尝试最新的firefox测试版吗?那就装到/opt目录下吧，这样，当你尝试完，想删掉firefox的时候，你就可 以直接删除它，而不影响系统其他任何设置。安装到/opt目录下的程序，它所有的数据、库文件等等都是放在同个目录下面。
举个例子：刚才装的测试版firefox，就可以装到/opt/firefox_beta目录下，/opt/firefox_beta目录下面就包含了运 行firefox所需要的所有文件、库、数据等等。要删除firefox的时候，你只需删除/opt/firefox_beta目录即可，非常简单

/usr/local

这里主要存放那些手动安装的软件，即不是通过“新立得”或apt-get安装的软件。它和/usr目录具有相类似的目录结构。让软件包管理器来管理/usr目录，而把自定义的脚本(scripts)放到/usr/local目录下面，我想这应该是个不错的主意
{% endnote %}
