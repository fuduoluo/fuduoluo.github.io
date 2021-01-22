---
title: 禅道安装笔记

top_img: https://i.loli.net/2020/06/29/fpvousCXDnj48Vm.png
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://i.loli.net/2020/06/29/fpvousCXDnj48Vm.png
abbrlink: d1b59bb9
date: 2020-06-29 00:10:52
updated: 2020-06-29 00:10:52
tags: 宝塔
categories: Linux
keywords: 宝塔安装禅道
description: 纯手工打造禅道项目管理软件
---

{% note danger flat %}
注: 请确保域名已经解析到服务器上。
{% endnote %}
### 环境搭建
{% note warn flat %}
web服务：Nginx
数据库：mysql
PHP：5.6
{% endnote %}
### [安装文档地址](https://www.zentao.net/book/zentaopmshelp/299.html)
 ![image.png](https://i.loli.net/2020/06/29/k7spoKqgCmJlz6x.png)
### [下载地址](https://www.zentao.net/download/zentaopms12.3.2-80227.html)
![下载地址](https://i.loli.net/2020/06/29/4BoO5jSlreszcJ2.png)
### 操作过程
- 添加站点
![添加站点](https://www.zentao.net/file.php?f=201809/f_dfb70819bc272bdfa38d165bd71235f2.png&t=png&o=&s=full&v=1538189161)
- 上传文件
{% note info  flat%}
下载禅道源码包，解压后得到zentaopms文件夹，将里面的所有文件上传到网站根目录下。
{% endnote %}
- 设置运行目录
{% note info  flat%}
在宝塔面板的网站管理中，点击相应站点的设置按钮，在网站目录中设置运行目录。将运行目录指向/www目录
{% endnote %}
![设置运行目录](https://www.zentao.net/file.php?f=201809/f_8a81de45973e58fcf7f7d43ece521d55.png&t=png&o=&s=full&v=1538189161)
- 配置文件
{% note info  flat%}
配置文件中端口号、域名、站点根目录等信息根据自己实际情况填写
{% endnote %}
- 伪静态设置
![伪静态设置](https://www.zentao.net/file.php?f=201809/f_273f7959d33b7e6a4fa1f03833ae8158.png&t=png&o=&s=full&v=1538189161)
```
if (!-d $request_filename){
set $rule_0 1$rule_0;
}
if (!-f $request_filename){
set $rule_0 2$rule_0;
}
if ($rule_0 = "21"){
rewrite /(.*)$ /index.php/$1 last;
}
```
- 重启NGINX
![重启NGINX](https://www.zentao.net/file.php?f=201809/f_746942db4021538168882b10895ab8da.png&t=png&o=&s=full&v=1538189161)

- 安装禅道
{% note warn flat %}
傻瓜式进行安装禅道
{% endnote %}
### 遇到问题
- 安装禅道到操作数据库时出现以下错误：
{% note danger flat %}
Access denied for user 'root'@'localhost'  xxxxxx
{% endnote %}
### 解决问题
- 进入wwwroot文件夹中找到该禅道上传文件
- 进入/www/wwwroot/zentaopms/config--以自己安装目录为准
- 新建文件my.php
```
<?php
$config->installed       = true;
$config->debug           = false;
$config->requestType     = 'PATH_INFO';
$config->timezone        = 'Asia/Shanghai';
$config->db->host        = '服务器IP地址';
$config->db->port        = '3306';
$config->db->name        = '数据库名称';
$config->db->user        = '用户名';
$config->db->encoding    = 'UTF8';
$config->db->password    = '密码';
$config->db->prefix      = 'zt_';
$config->webRoot         = getWebRoot();
$config->default->lang   = 'zh-cn';
```