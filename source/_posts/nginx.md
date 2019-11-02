---
title: Nginx的那些事儿
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: a477be03
date: 2019-09-05 22:04:31
updated: 2019-09-05 22:04:31
categories: Nginx
tags: Nginx
subtitle:
cover: https://cdn.jsdelivr.net/npm/@bootcss/www.bootcss.com@0.0.3/dist/img/nginx.jpg
---
<meta name="referrer" content="never">

##### nginx从入门到实践

[nginx从入门到实践](https://juejin.im/post/5a2600bdf265da432b4aaaba)

##### PHP-FPM,Nginx,FastCGI 之间的关系
[PHP-FPM,Nginx,FastCGI 之间的关系](https://juejin.im/post/5a04210b518825296421237c)

##### 一文弄懂Nginx的location匹配
[一文弄懂Nginx的location匹配](https://juejin.im/post/5cbe89b6f265da0373718707)


###### Nginx+Php-fpm+fastcgi 运行原理详解
[Nginx+Php-fpm 运行原理详解](https://juejin.im/post/58db7d742f301e007e9a00a7)

<!--more-->
##### nginx 重启权限问题
![image.png](https://upload-images.jianshu.io/upload_images/3098875-957a4165f57f1104.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

解决：
```
加上权限拥有者 
sudo nginx -s reload
service nginx restart

```
##### nginx 文件权限写入问题
![文件权限写入问题](https://upload-images.jianshu.io/upload_images/3098875-8e4a3e04b4b51bd0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

解决：
```
进入到写入文件的父级文件夹修改权限
 sudo chmod 777 /usr/local/nginx-1.8.0/logs
```
##### nginx vagrant配置文件位置
```
/usr/local/nginx-1.8.0/conf/vhosts
```
![vagrant配置文件位置](https://upload-images.jianshu.io/upload_images/3098875-96540538a5af5be9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
