---
title: 编译安装Mysql
permalink: 'posts/:abbrlink.html'
copyright: true
categories: Mysql
tags: Mysql编译安装
top_img: https://i.loli.net/2020/03/20/mCo37Ate5FDxjE1.jpg
abbrlink: 2ce8eb6c
date: 2019-10-29 16:37:25
updated: 2019-10-29 16:37:25
subtitle:
cover: https://i.loli.net/2020/03/20/mCo37Ate5FDxjE1.jpg
---
<meta name="referrer" content="never">
<blockquote class="blockquote-center">编译安装Linux centos7 mysql数据库</blockquote>

####  1·下载官网压缩包安装前的准备
###### 辨识标准
[其他辨别方法链接](https://blog.csdn.net/haopeng7816/article/details/83956679)

 ```
PC server X86 系列
I386--I686 都是32位
x86_64 是 64位
```
###### 查看linux系统版本32位还是64位
```
我的本机是64位的centos7系统
查看命令:
uname  -a
getconf LONG_BIT
内容显示:
执行命令：uname  -a
Linux bogon 3.10.0-957.5.1.el7.x86_64
#1 SMP Fri Feb 1 14:54:57 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

<!--more-->
![查看linux系统位数](https://upload-images.jianshu.io/upload_images/3098875-9e96cc7371c670ce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 访问官网进入下载页面
![访问官网进入下载页面](https://upload-images.jianshu.io/upload_images/3098875-a32a145247b12fd2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 往下找到该位置 MySQL Community (GPL) Downloads »
![MySQL Community (GPL) Downloads ](https://upload-images.jianshu.io/upload_images/3098875-285aeee53d730887.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![找到community server](https://upload-images.jianshu.io/upload_images/3098875-1ea1ad1163da3626.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![从这边准确找你想要安装的mysql包](https://upload-images.jianshu.io/upload_images/3098875-78d1442195229889.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![下载对应系统包](https://upload-images.jianshu.io/upload_images/3098875-7924fc8a64e79ef3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![本次下载版本](https://upload-images.jianshu.io/upload_images/3098875-10797280dba094fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 解压过程中出现以下问题：
```
tar: Exiting with failure status due to previous errors
网上概述说是没有sudo权限或者是没在其当前目录进行解压，经测试还是会出现这个问题!
```
##### 于是尝试另外一种方法
###### 2.安装仓库源并选择对应版本进行安装！！！
##### 参考步骤如下
[安装步骤链接](https://juejin.im/post/5c088b066fb9a049d4419985)

```
先检查系统是否装有mysql
rpm -qa | grep mysql    返回空说明没有安装相关服务
注意：
yum install mysql安装命令是无效的，
因为centos-7默认是Mariadb，所以执行以下命令只是更新Mariadb数据库
```
##### 设置mysql 默认编码格式出现重启失败
```
[root@bogon vagrant]# service mysqld restart
Redirecting to /bin/systemctl restart mysqld.service
Job for mysqld.service failed because the control process exited with error code.
 See "systemctl status mysqld.service" and "journalctl -xe" for details.
解决：
1，进入编辑my.cnf
vi /etc/my.cnf
2，在[mysqld]   下边   添加以下内容
character-set-server=utf8
init_connect='SET NAMES utf8'
3，在[mysqld]    上边   添加以下内容
[mysql]
default-character-set=utf8
4，重启MySQL
systemctl restart mysqld
```
![解决后的截图](https://upload-images.jianshu.io/upload_images/3098875-c862505bcf232f29.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 查看默认数据库密码
```
sudo cat /var/log/mysqld.log | grep -i 'temporary password'
```
##### 查看数据库编码格式
```
show variables like '%character%';
```
##### 使用初始化密码进入数据库不能进行任何操作需修改原始密码

ALTER USER 'root'@'localhost' IDENTIFIED BY 'new password';
//以下命令是在有User表的情况下进行修改
UPDATE user SET Password = 'new-password' WHERE User = 'root';

！！！！出现以下错误:
mysql5.7默认安装了密码安全检查插件（validate_password），默认密码检查策略要求密码必须包含：
大小写字母、数字和特殊符号，并且长度不能少于8位.

##### ALTER USER 'root'@'localhost' IDENTIFIED BY 'Chewc10!14';

密码策略问题异常信息
ERROR 1819 (HY000): Your password does not satisfy the current policy requirements

##### 查看密码策略机制,需要重置原始密码
show variables like '%password%';

navicat连接失败：
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
密码错误

[查看密码策略参考文章](https://blog.csdn.net/hello_world_qwp/article/details/79551789)
##### 登录mysql命令
```
sudo  mysql -u root -p
mysql常用选项
    -u：指定用户
    -p：密码
    -h：一般用于远程登录，后面+服务器ip主机名
    -P：+端口
    -S：+套接字文件
```
##### 忘记mysql数据库登录密码修改
[centos7 忘记Mysql登录密码](https://www.cnblogs.com/yanziwen/p/9215264.html)
##### 开启远程连接
[CentOS7 安装MySQL并开启远程连接](https://blog.csdn.net/qq_39248703/article/details/88875174)

##### MySQL导入sql文件，过大导致错误（2006 - MySQL server has gone away）
 ```
只对当前导入有效：
查看通信缓冲区的最大长度：

show global variables like 'max_allowed_packet';

默认最大是1M，可以修改通信缓冲区的最大长度，修改为16M:

set global max_allowed_packet=1024*1024*16;

如果是想永久生效，可以修改配置文件，
在my.ini（windows下）或者my.cnf（linux下）加入或修改配置：
max_allowed_packet = 16M

重启mysql
```

