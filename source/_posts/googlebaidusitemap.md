---
title: 百度[待定]Google收录站点

copyright: true
categories: Baidu-Google
tags: Baidu-Google
top: true
abbrlink: 895444f1
date: 2019-07-25 09:57:50
updated: 2019-04-19 12:57:50
subtitle:
cover: https://i.loli.net/2020/03/20/LOYJRzZjaHg618A.png
top_img: https://i.loli.net/2020/03/20/LOYJRzZjaHg618A.png
---

<blockquote class="blockquote-center">hexo站点地图收录</blockquote>

{% note success flat %}
网站的SEO对一个网站非常重要，SEO指的是搜索引擎优化。通过搜索引擎优化，可以提高网站的网站关键词排名以及博客文章的曝光度。
一般来说，我们针对百度和Google这两个搜索引擎进行优化，提高对网站资源的索引量，使我们的文章更容易被发现。
{% endnote %}


###### 生成站点地图

1.安装百度和Google的站点地图生成插件：
```
npm install hexo-generator-baidu-sitemap --save //百度地图生成插件
npm install hexo-generator-sitemap --save //谷歌地图生成插件
```
<!--more-->

2.修改站点配置文件(可选)
```
# 自动生成sitemap
sitemap:
  path: sitemap.xml
baidusitemap:
  path: baidusitemap.xml
```
3.生成和部署
```
在根目录下public文件中会生成sitemap.xml(谷歌)和baidusitemap.xml(百度)两个文件即站点地图
```
###### Google站长平台

> 自备梯子+谷歌账号

[Google站长平台入口](https://www.google.com/webmasters/#?modal_active=none)
#### 1.添加站点
>进入Search Console，添加站点：

![使用GitHubpage请选择网址前缀进行验证](https://i.loli.net/2020/03/22/ZGKRuwMh4eYkXlx.png)

#### 2.验证站点
![验证站点](https://i.loli.net/2020/03/22/1NhRlyWGMf6Z2w7.png)
- 下载Google验证文件，放到themes/next/source目录中
-  执行生成和部署命令验证即可
```
hexo g && hexo d
```
#### 已完成站点的验证
![完成验证站点](https://i.loli.net/2020/03/22/BFmlkvKgjAnSJM3.png)

#### 3.添加站点地图
![image.png](https://i.loli.net/2020/04/19/siW8KpgHxNZ5EkY.png)

![解决问题](https://i.loli.net/2020/03/22/m1IbcSigMnUXFBq.png)

#### 效果如下：
![image.png](https://i.loli.net/2020/04/19/koHOjgxBQNtFdeT.png)

