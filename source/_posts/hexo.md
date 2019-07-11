---
title: hexo搭建问题汇总
permalink: 'posts/:abbrlink.html'
copyright: true
categories: hexo
tags: hexo
abbrlink: cded68c5
date: 2019-07-12 00:27:11
updated: 2019-07-12 00:27:11
subtitle:
top: true
---
#### 1.hexo 发布之后 gitpage 自定义域名失效
- 起因：每次配置 custom domain 之后，再次 hexo deploy 之后，custom domain 会被重置失效。
<!--more-->
######方法：在 hexo 生成的博客的 source 目录下新建一个 CNAME 文件，然后在这个文件中填入你的域名，
这样就不会每次发布之后，gitpage 里的 custom domain 都被重置掉啦。

![添加路径](https://upload-images.jianshu.io/upload_images/3098875-db6877df60ef748e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 使用 gitpage 功能将博客托管在了 github 上，并配置 CNAME 将自己的域名解析了过去，
在 github 的仓库设置中开始 custom domain 的功能，这时候就可以直接使用自己的域名访问啦。

![配置github page域名](https://upload-images.jianshu.io/upload_images/3098875-c40da031137a0c4f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


