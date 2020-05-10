---
title: 如何清理微信缓存
permalink: 'posts/:abbrlink.html'
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
top_img: 'https://i.loli.net/2020/03/20/LkXy5aFSPhH2wtV.png'
cover: 'https://i.loli.net/2020/03/20/LkXy5aFSPhH2wtV.png'
tags: Cookie
categories: Cookie
keywords: wechat Cookie
description: tell something about how to clean the wechat cookie
abbrlink: 26caa4da
date: 2020-04-22 10:05:43
updated: 2020-04-22 10:05:43
---

<blockquote class="blockquote-center">如何清除微信缓存</blockquote>
{% note warning %}
是否遇到过缓存清理，尤其是si在微信上~~~~~~
出现缓存问题可能导致用户出现很多车祸现场，主要上线了的项目需要内部测试
于是就有下面去折腾了，哈哈哈哈
{% endnote %}

### 之所以的以为
>我一直在app找了很久，发现在微信app里面，可惜啊，没有就是没有！！
### 开光瞬间
- Android版本微信
>用微信内置浏览器打开这个网页debugx5.qq.com或者是直接在微信app打开http://debugtbs.qq.com/
微信x5内核浏览器的debug调试页面，直接在微信打开，点击X5选项拉到页面最底部，有清理缓存的选项
<h1 align="center"><a target="_blank" herf="####" alt="shareRepository"><img src="https://i.loli.net/2020/04/22/VHLWXGuz8w5NsYp.jpg" width = "400" style="max-width:100%;align:center"/></a></h1>
- Ios版本微信--图片源自网络
>1.微信设置-通用-存储-清理缓存；
 2.进入页面，右上角‘...’选项中点击“刷新”，不行就多刷新几次

![image.png](https://i.loli.net/2020/04/22/491url8j6DQEbJa.png)
- 自动刷新缓存
>1.解决方案是在调试阶段或者频繁更新的页面加入以下头信息
```
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
```