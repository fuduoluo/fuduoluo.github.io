---
title: Hexo提交百度(待定)和Google收录站点
permalink: 'posts/:abbrlink.html'
copyright: true
categories: Google-sitemap
tags: SEO Google-sitemap  Hexo
abbrlink: 895444f1
date: 2019-07-25 09:57:50
updated: 2019-07-25 09:57:50
subtitle:
cover: 
top_img: 
---
<meta name="referrer" content="never">
<blockquote class="blockquote-center">hexo站点地图收录</blockquote>

{% note success %}
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
###### 1.添加站点
>进入Search Console，添加站点：

![使用GitHubpage请选择网址前缀进行验证](https://upload-images.jianshu.io/upload_images/3098875-32bb9281428b738f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 2.验证站点
![图片来自网络](https://upload-images.jianshu.io/upload_images/3098875-a3b45bd0980abbfd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 下载Google验证文件，放到themes/next/source目录中
-  执行生成和部署命令验证即可
```
hexo g && hexo d
```
###### 由于我已经验证过所以会自动完成站点的验证
![验证站点](https://upload-images.jianshu.io/upload_images/3098875-144e9a44531c5761.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 3.添加站点地图
![步骤如下](https://upload-images.jianshu.io/upload_images/3098875-9306fcee433db0a6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 出现问题：
> 添加完成后站点地图状态一直是无法读取[但是解决完后状态一直是无法读取]

![解决问题](https://upload-images.jianshu.io/upload_images/3098875-a2cba7ad8e1a9569.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


###### 效果如下：
![搜索结果](https://upload-images.jianshu.io/upload_images/3098875-8ca47d711c101eae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

[参考文章+部分图片来源](https://www.93bok.com/Hexo%E6%8F%90%E4%BA%A4%E7%99%BE%E5%BA%A6%E5%92%8CGoogle%E6%94%B6%E5%BD%95%E7%AB%99%E7%82%B9/)

>有知道的朋友请留言告诉我下
