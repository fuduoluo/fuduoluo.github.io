---
title: ThinkPHP5手记
permalink: 'posts/:abbrlink.html'
top_img: https://box.kancloud.cn/2015-12-12_566b6a10506a4.png
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: 'https://box.kancloud.cn/2015-12-12_566b6a10506a4.png'
categories: ThinkPHP5
keywords: ThinkPHP5
description: ThinkPHP5日常手记
abbrlink: 3ec68ba4
date: 2019-12-27 20:29:21
updated: 2019-12-27 20:29:21
tags:
---
<meta name="referrer" content="never">
<blockquote class="blockquote-center"></blockquote>
{% note success %}
ThinkPHP V5.0——为API开发而设计的高性能框架
{% endnote %}

#### Token令牌[管理api接口的好助手]
##### Token令牌是客户身份识别码
##### 通用思路Token令牌大致流程
![Token令牌使用流程](https://upload-images.jianshu.io/upload_images/3098875-fde0010ea95839b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 用户获取令牌，完成客户注册过程
-  用户携带账号密码请求服务端getToken方法生成令牌 

![客户端请求接口](https://upload-images.jianshu.io/upload_images/3098875-d7e7a44698850764.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 用户请求接口时携带Token，去请求例如下单接口，在根据令牌去确认用户是否有权限去请求该接口
- 是否有权限请求接口：1.数据有该用户Token值 2.Token设置有效时间 3.根据Token值对应的权限分组




