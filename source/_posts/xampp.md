---
title: Xampp汇总

top_img: https://i.loli.net/2020/03/20/hDBRKMuCLEp5d7z.jpg
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://i.loli.net/2020/03/20/hDBRKMuCLEp5d7z.jpg
categories: Xampp
keywords: xampp
abbrlink: 2da0cc6f
date: 2019-12-26 11:01:26
updated: 2020-03-20 09:12:26
tags: Xampp
description:
---

<blockquote class="blockquote-center"></blockquote>
{% note success flat %}
XAMPP 配置虚拟域名/localhost重定向
{% endnote %}

#### XAMPP 配置虚拟域名/localhost重定向
[参考地址：XAMPP 配置虚拟域名/localhost重定向](https://juejin.im/post/5c85cc00f265da2dae5158aa#heading-6)

##### 主要修改两个地方
- hosts文件 填写的域名
- httpd-vhosts.conf文件 配置虚拟域名和目录
##### 配置前提
- 前往本地 xampp/xamppfiles/etc/httpd.conf 查看引入httpd-vhosts.conf 看看是否打开，如果被注释了去掉#
    ```
    # Virtual hosts
    Include conf/extra/httpd-vhosts.conf
    ```
##### 配置如下：
```
// 在多项目的情况下就无法查看其他的项目 解决方法如下
<VirtualHost *:80>
    #ServerAdmin webmaster@dummy-host2.example.com
    DocumentRoot "D:/xmapp/htdocs/"
    ServerName localhost
    ErrorLog "logs/dummy-host2.example.com-error.log"
    CustomLog "logs/dummy-host2.example.com-access.log" common
</VirtualHost>

 // 配置虚拟域名和目录
<VirtualHost *:80>
    #ServerAdmin webmaster@dummy-host2.example.com
    DocumentRoot "D:/xmapp/htdocs/Zerg/public"  #自定义项目地址  反斜杠
    ServerName zerg.cn  # 虚拟域名
    ErrorLog "logs/dummy-host2.example.com-error.log"
    CustomLog "logs/dummy-host2.example.com-access.log" common
</VirtualHost>
```
##### 解决

![请求成功](https://i.loli.net/2020/03/22/PhXFV2Jt79A6vDj.png)

![其他项目IP为内网地址](https://i.loli.net/2020/03/22/mloKuWf6OQDZqIe.png)

#### xmapp：phpmyadmin连接，管理多个mysql服务器[本地和内网]

> **方法一，修改phpMyAdmin/libraries/config.default.php**
>
> **修改配置文件前，最好先备份一下，万一改错地方了**

> **方法二，同时管理多个mysql服务器。**
>
> **1，将phpMyAdmin根目录下的config.sample.inc.php，重命名为config.inc.php**，将原本都注释掉
>
> **2，修改config.inc.php文件**，通过循环遍历连接

```js
$connect_hosts = array(
    '1' => array(
        "host"   => "localhost",  //服务器1  
        "user"   => "root",
        "password" => "root"
    ),
    '2' => array(
        "host"   => "IP地址", //服务器2  
        "user"   => "xxxx",
        "password" => "xxxx"
    )
);

for ($i = 1; $i <= count($connect_hosts); $i++) {
    /* Authentication type */
    $cfg['Servers'][$i]['auth_type'] = 'cookie';
    /* Server parameters */
    $cfg['Servers'][$i]['host'] = $connect_hosts[$i]['host'];   //修改host  
    $cfg['Servers'][$i]['connect_type'] = 'tcp';
    $cfg['Servers'][$i]['compress'] = false;
    /* Select mysqli if your server has it */
    $cfg['Servers'][$i]['extension'] = 'mysql';
    $cfg['Servers'][$i]['AllowNoPassword'] = true;//是否允许空密码登录
    $cfg['Servers'][$i]['user'] = $connect_hosts[$i]['user'];  //修改用户名  
    $cfg['Servers'][$i]['password'] = $connect_hosts[$i]['password']; //密码  
    /* rajk - for blobstreaming */
    $cfg['Servers'][$i]['bs_garbage_threshold'] = 50;
    $cfg['Servers'][$i]['bs_repository_threshold'] = '32M';
    $cfg['Servers'][$i]['bs_temp_blob_timeout'] = 600;
    $cfg['Servers'][$i]['bs_temp_log_threshold'] = '32M';
    /* User for advanced features */
    $cfg['Servers'][$i]['controluser'] = $connect_hosts[$i]['user'];
    $cfg['Servers'][$i]['controlpass'] = $connect_hosts[$i]['password'];
}
```

![image.png](https://i.loli.net/2020/03/22/7bY2RlWkZsEyK5C.png)

##### 可能遇到问题：

> xmapp默认mysql密码是空的，所以导致PHPmyadmin登录不了，不允许空密码登录。

```js
$cfg['Servers'][$i]['AllowNoPassword'] = true;是否允许空密码登录
$cfg[‘blowfish_secret’] = ‘123456’; // 你要设置的密码
```

![image.png](https://i.loli.net/2020/03/22/xFqTsLaYjwtv19z.png)

#### xmapp和phpstudy同时启动mysql服务

![image.png](https://i.loli.net/2020/03/22/9IKVuw4mkDTqz61.png)

> 之前会遇到两个mysql不能同时启动，现在比较简单做法是先确定xmapp的mysql版本号
>
> phpstudy相对于下载对应版本[端口号什么都不用改变，只需要安装对应版本就行]
>
> 我这phpstudy安装是5.5.29

![image.png](https://i.loli.net/2020/03/22/Gp3qQZMdnwXx9k2.png)


