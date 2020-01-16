---
title: 永久激活PHPstorm编辑器
permalink: 'posts/:abbrlink.html'
top_img: https://upload-images.jianshu.io/upload_images/3098875-79cc44d1d5a78b47.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://upload-images.jianshu.io/upload_images/3098875-79cc44d1d5a78b47.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240
abbrlink: 7a17374d
date: 2020-01-15 14:49:36
updated: 2020-01-15 14:49:36
tags:
categories: phpstorm IDE
keywords: PHPSTORM  IDE  tool
description: active 
---
<meta name="referrer" content="never">
{% note success %}
本教程仅供学习使用，切勿商务用途。若有问题，后果自负。
{% endnote %}

#### 以下是激活window为例
#### 下载压缩包
作者提供下载地址
{% note success %}
下载链接: https://pan.baidu.com/s/19NNaNv7OeJ92mcSL_sA7Mw 
提取码: 7fy6
{% endnote %}
以上链接失效的话尝试如下地址
{% note success %}
链接：https://pan.baidu.com/s/1P3nj76Tpop10oxZfTqWIDw 
提取码：sxj9 
{% endnote %}

#### 解压压缩包放置任意位置
![phpstorm安装位置和解压包放置位置](https://upload-images.jianshu.io/upload_images/3098875-2d79131c1106cb23.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
#### 启动你的IDE，如果上来就需要注册，选择:试 (Evaluate for free)进 IDE
#### 点击你要注册的IDE菜单: Configure 或 Help -> Edit Custom VM Options ...如果提示是否要创建 件，请点 Yes 
#### 打开phpstorm64.exe.vmoptionswe年添加压缩包路径
![添加压缩包配置文件](https://upload-images.jianshu.io/upload_images/3098875-abac70a83c66fdda.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
{% note success %}
以我本机为例，注意不要使用中文命名
一定要自己确认好路径( 不要使用中文路径)，填错会导致IDE打不开!!!最好使用绝对路径。 
一个vmoptions内只能有一个 -javaagent 参数。
{% endnote %}
```
示例:
    mac:  -javaagent:/Users/neo/jetbrains-agent.jar
    linux:  -javaagent:/home/neo/jetbrains-agent.jar
    windows: -javaagent:C:\Users\neo\jetbrains-agent.jar
    本机：-javaagent:E:\PHPstorm\jetbrains-agent.jar
```
#### 重启IDE
#### 选择License server进行注册
##### 注册方式我选择第一种，另外一种我没有尝试
点击IDE菜单 Help -> Register... 或 Configure -> Manage License...
支持两种注册方式:License server 和 Activation code:
选择License server方式，
地址填 : http://jetbrains-license-server
或者点击按钮: Discover Server 来 自动填充地址
##### IDE升级会从旧版本导 以上设置，导入配置后可能提示未注册(因为刚导入的vmoptions未生效)，直接重启IDE即可，无需其他操作
#### 感谢作者的分享，关注公众号：源码站
[感谢作者分享该教程，详细教程请点击这里](https://mp.weixin.qq.com/s?__biz=MzI1ODYyODAwNQ==&mid=100000335&idx=1&sn=c77b63784b5b647710823480c09034f0&chksm=6a0402855d738b93baee8ca1a824dc4e58b3e83842b6279346eed646078ce84bf7a7aabe5da5&scene=20&xtrack=1&key=502e06af756d4cb04377922d22b73e81deab910af219eaf7294382cf6a12d8a8fe18340bba04c06ad95f426f212b5fa4535815773f12e26322f2d10709aff364e2803e73d4b5873acbe368628a502033&ascene=1&uin=Nzc5Njg4NzAz&devicetype=Windows+10&version=62070158&lang=zh_CN&exportkey=AeIOvo%2B9JKfiE6ks3c7%2B6A0%3D&pass_ticket=gkhf1X5NOmcKe9civKguQPE9C6vYoOVr8p483MF3ee8tnHorVS8prgMxMgMmkO%2F3)
