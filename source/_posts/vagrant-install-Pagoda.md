---
title: vagrant虚拟机安装centos和宝塔

copyright: true
abbrlink: 5a9ca69a
date: 2019-07-11 21:31:10
updated: 2019-07-11 21:31:10
categories: vagrant 
tags:  vagrant
subtitle:
cover: https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=b7c0b9d9fc36afc30e0c38638b228cf9/203fb80e7bec54e7825eee07b2389b504fc26a7d.jpg

---
<blockquote class="blockquote-center">Linux权限,安装宝塔</blockquote>
<!--more-->


#### 重置sudo密码 如何应用root权限？

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

![重置sudo密码](https://i.loli.net/2020/03/22/7ysDKTV1U8FupLC.png)
```
新：root
切换用户权限
exit 退出
```
![image.png](https://i.loli.net/2020/03/22/ECUpQ9jbDhyzLmA.png)

#### 安装宝塔出现权限错误
```
切换为root 进行安装
```
#### 安装宝塔出现登录不了
![image.png](https://i.loli.net/2020/03/22/7ysDKTV1U8FupLC.png)
![image.png](https://i.loli.net/2020/03/22/NYHRp4zZoWrL7qP.png)
```
配置私有地址：
config.vm.network "private_network", ip: "192.168.33.20"
```
#### vagrant+centos7 安装报错
[vagrant+centos7 安装报错传送门](https://blog.csdn.net/shilei_zhang/article/details/72811274)
#### 设置同步映射文件路径报错
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
##### 解决：
```
vagrant plugin install vagrant-vbguest
vagrant reload --provision
```
#### 线上服务器上传本地项目访问没有找到文件(前提已购买域名 并绑定到购买服务器上)
![image.png](https://i.loli.net/2020/03/22/lQ7sW2d5DtFkARK.png)


##### 忘记查看宝塔登录端口URL
![image.png](https://i.loli.net/2020/03/22/KptCAWaqMjO2cSB.png)
