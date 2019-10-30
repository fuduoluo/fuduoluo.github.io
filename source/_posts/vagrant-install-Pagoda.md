---
title: vagrant虚拟机安装centos和宝塔
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 5a9ca69a
date: 2019-07-11 21:31:10
updated: 2019-07-11 21:31:10
categories: vagrant centos 
tags:  centos宝塔
subtitle:
---
<blockquote class="blockquote-center">Linux权限,安装宝塔</blockquote>
<!--more-->
<meta name="referrer" content="never">

##### 重置sudo密码 如何应用root权限？

- (1)sudo 命令  
这样输入当前管理员用户密码就可以得到超级用户的权限。但默认的情况下5分钟root权限就失效了。
- (2)sudo -i
通过这种方法输入当前管理员用户的密码就可以进到root用户。
- (3)如果想一直使用root权限，要通过sudo切换到root用户。
重设置root用户的密码：
sudo passwd root
设置root用户的新密码。
之后自由的切换到root用户了
输入root用户的密码即可。
当然，如果想从root用户切换回一般用户，则可使用  su -val(一般用户名)
而当你再次切回到root用户，则只需要键入exit,再次输入exit则回到最初的用户下

![重置sudo密码](https://upload-images.jianshu.io/upload_images/3098875-cd759068f6abaf13.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
新：root
切换用户权限
exit 退出
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-09b49ce7a5dd5e82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 安装宝塔出现权限错误
```
切换为root 进行安装
```
##### 安装宝塔出现登录不了
![image.png](https://upload-images.jianshu.io/upload_images/3098875-e378ba339ef6ef17.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 解决
![image.png](https://upload-images.jianshu.io/upload_images/3098875-3c7e3bdd89a54a6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
配置私有地址：
config.vm.network "private_network", ip: "192.168.33.20"
```
##### vagrant+centos7 安装报错
[vagrant+centos7 安装报错传送门](https://blog.csdn.net/shilei_zhang/article/details/72811274)
##### 设置同步映射文件路径报错
```
config.vm.synced_folder "D:/vagrant/centos/", "/var/www"
报错以下：

Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:
mount -t vboxsf -o uid=1000,gid=1000 var_www /var/www
The error output from the command was:
mount: unknown filesystem type 'vboxsf'
```
###### 解决：
```
vagrant plugin install vagrant-vbguest
vagrant reload --provision
```
##### 线上服务器上传本地项目访问没有找到文件(前提已购买域名 并绑定到购买服务器上)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-b1b9746a1d0d36c0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


###### 忘记查看宝塔登录端口URL
![宝塔登录端口URL](https://upload-images.jianshu.io/upload_images/3098875-15309752537182ad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



