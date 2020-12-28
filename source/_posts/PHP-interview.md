---
title: 360解读PHP面试题

copyright: true
categories: PHP
tags: 360解读PHP面试
abbrlink: 263d185a
cover: https://i.loli.net/2020/03/20/qeC8SmpIi5WT3gY.jpg
top_img: https://i.loli.net/2020/03/20/qeC8SmpIi5WT3gY.jpg
date: 2019-09-01 01:34:28
updated: 2019-09-01 01:34:28
subtitle:
password: interview
---
<meta name="referrer" content="no-referrer" />
<blockquote class="blockquote-center">360解读PHP面试题(理论)</blockquote>

##### 1.php引用变量
[引用传值的核心原理解析](https://www.cnblogs.com/chrdai/p/11061174.html)

##### 2.php字符串定义方式和区别
单引号：不能解析变量 转义字符  效率高
 双引号：解析变量 特殊字符  {}包含  转义字符  效率低
[heredoc newdoc区别](https://blog.csdn.net/fdipzone/article/details/24937669)

##### 3.常量与数据类型
[数据类型](https://www.w3school.com.cn/php/php_superglobals.asp)
<!--more-->

##### 4.运算符
错误抑制符@：放在PHP表达式前面可以抑制任何错误信息
![image.png](https://upload-images.jianshu.io/upload_images/3098875-a3bf50b3e0ce6b58.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-0d75e5130c501e81.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 5.php遍历数组三种方式及区别
for
foreach
while list  each

![image.png](https://upload-images.jianshu.io/upload_images/3098875-1afcf535ef260425.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 6.自定义函数及其内部函数
![image.png](https://upload-images.jianshu.io/upload_images/3098875-90fac53f52edde18.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 变量作用域
![image.png](https://upload-images.jianshu.io/upload_images/3098875-3f1fa7b1ceeee905.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

global 关键字 函数体内设置全局
global $outer ->全局变量
$GLOBAL['$outer']

###### 静态变量 static
![image.png](https://upload-images.jianshu.io/upload_images/3098875-face571d5c79d25c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-8437386479b9eb24.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-e0d08131fdeb336e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-50586453e255c837.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-77375a7091984f73.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
$a = 1;
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-dd2c5b403be70d6e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-ddf731e94865a6d8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-7292ceb55626a8d7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-e2f5037a5dae3f39.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-06d0815113639584.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-737ffb4c3102c242.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-00037196c90b9389.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-50fe27e34073c2e7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-dc19e59ed446c293.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-c106fe9bad4b9d12.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-684009fe7d57c31c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-b89df1ba5e2cba00.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-7cbceb83bfa8111c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 7.正则表达式
##### 8.文件及目录处理
##### 9.会话控制技术
###### 为什么要使用会话控制技术？
[为什么要使用会话控制技术文章](https://www.jianshu.com/p/a3e7e67c5f12)

允许服务器跟踪同一个客户端做出的连续请求，这样就可以保存用户的状态，完成用户的登录状态的保存

##### 10.面向对象
![image.png](https://upload-images.jianshu.io/upload_images/3098875-29f1dda1d44ebc2c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-54ce352ba8d215d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-c0a4036b861e3911.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
方法重写：会覆盖父类方法--->防止覆盖 先使用parent::父类方法在执行子类方
单一继承：只能同时继承一个父类
![image.png](https://upload-images.jianshu.io/upload_images/3098875-26e1858fab56cb55.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-55afda835b4c1f67.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-0c4cc01f53ef6eaf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 11.网络协议
![image.png](https://upload-images.jianshu.io/upload_images/3098875-d6679437164ff39d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-ebfd10d72269fca7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-76134398491c029e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-f3daa5cfdd2d0fc1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-033c55c1903b5249.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-5c507dafb41f98ef.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-f3333158d73ee540.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-91a565762c98f4f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-08bd94f3d2b8e19c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-9f01cf9142e5d441.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-24708ac11a974e3f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-817a194d27674c41.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-791cd3e123ce6b44.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-7ba375c985dbae82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-3ad1a12721490a48.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 12.开发环境及其配置相关
版本控制软件：集中式和分布式
![image.png](https://upload-images.jianshu.io/upload_images/3098875-89a54d30dfb08dbe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-b8ed5e9b812e4be7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###### CGI   FASTCGI    PHP-FPM

![image.png](https://upload-images.jianshu.io/upload_images/3098875-998fc5db5c0ef585.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 14.JS和JQ基础
![image.png](https://upload-images.jianshu.io/upload_images/3098875-9cc6c7dd96b8a492.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-5ba7059f7d296451.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-5c21e8382301c221.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-d42d30cd2987db33.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-15710c99966a40b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-030fd7ba12f5d9a4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 内置对象
number  string array boolean math regexp date 
![image.png](https://upload-images.jianshu.io/upload_images/3098875-447c788de871410e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-7b8ad0bf273cfdec.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-276b1460be92e855.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-9fcfcf140b8f85a6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-dd717a09fc747ef7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 15.AJAX
![image.png](https://upload-images.jianshu.io/upload_images/3098875-ab5040cb144909ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-6b0ab574c0e5de65.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a2b7019e13011fd7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-0b0740ef4ee47512.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-254587aef31c576f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-3972dc95a84d88b7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 16.Linux基础
![image.png](https://upload-images.jianshu.io/upload_images/3098875-dc14253c60132381.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-f2af438a6a26a354.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-b8a6ebc68f3b94e0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-fcc40f63e1e90ee5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-22e485863d84c394.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-b204e4e8da3be953.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bdd4736c851255cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

 ![image.png](https://upload-images.jianshu.io/upload_images/3098875-ae728164bdbf5b23.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-897c9aed8bd58ee7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-81dce788843af462.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-61352be2c74773fb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bf9e9821e2885f98.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-7f7df32ae35c3904.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-c229f73274615255.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-d6916da5f0130cc9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-d7b0b30dd756098d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a7950ecb1685c5e7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-31f466754b27ce7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-20eb8fc8acc4a88c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bdf6a0301bc02fc4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-4754aa098964ecbb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a5e56daa680e5326.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-ef01cec1b1f5a3b8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-4325891bdad43369.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-3b1338ee1e425b6b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-5bf91e201d6e8504.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-0aafe12b1f664d20.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-dc0665824fe6d918.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-4c8e2c45f424da82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 17.Mysql数据库

![image.png](https://upload-images.jianshu.io/upload_images/3098875-3d10aed5d765caed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-386a44a31a49cb1a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-b8f400e85e85b4ef.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-7246a502cee48a16.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-29abc95a1f3b544f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-171b395bd01d9ca2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-414b7df2d83075f8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-62e1aa0bff61c24e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a3a420e9e2516b66.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-206b41607ff6c943.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-92611a8413149f63.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-8700dbbc94c381cd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-9231166b7056fb10.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-502c22625d5c4896.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-766b6a4cac796352.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-02efead6f888b39d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-7979fffcb420ae38.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a94fbfb4e21f0178.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-3559794341142d66.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-8cd984b55a3d2504.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-c3840b2eb50cd7bf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-99d204a26761061e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-b486f02c53a8cf6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-ccc4140f7c58d1fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-3aaaf263cc0a7475.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-99a341230d5fd9c0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-b8c4235e8f7ab90e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 
![image.png](https://upload-images.jianshu.io/upload_images/3098875-d498e38a294bfc2f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-cf9a2b535ceb792b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-176cd4b57a6f9497.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-4b84f1379f1ab6bd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-71ad7e01fb688dec.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 18.Mysql查询优化

![image.png](https://upload-images.jianshu.io/upload_images/3098875-807e457426bdf25a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-60775a941b1d2571.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-cddf61c77d5112e0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a79dd138d3a384e8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-198759f18d405fbc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-053f7f5a157b0b26.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-6c15945311c4ff47.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-c4af137f79ea51e5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-6dd8f30b9439b629.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-7a0897541ac08454.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-77e11711c1f8e891.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-8a8562e147160cf5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-f37fd34244ce5930.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-d81ce6191dbdc0c2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-aa9202f97e4c1405.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-f8342feb8c796659.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a54fdd5d54ffc956.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-6760014605315128.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-5c6278227e6ffe5f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-8ec44eb7ddaa66f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a31f8742fc861c70.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a2dfb0556e03807a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 19.Mysql高复用 高可扩展
[mysql分区表详解](https://blog.csdn.net/u010320108/article/details/79460748)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-70ee0248fb30dd42.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-ac53301ab256bf1f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-e9fb4624819b86eb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-aa31a2084d8e5f68.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-792efaf7f760a669.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-5f13595ff72dc4c7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-8c6d04793f28fdf1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-10574d645de206e1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

[mysql分库分表](https://www.cnblogs.com/lfs2640666960/p/11116962.html)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bf992af1dc9a70cc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-46dd16da64c74947.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-905254413b0acf3c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-be6cd836e56ada22.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-e22ee9afacb392bb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bb5e2b8fc099a80b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-3e6721ced0cd1870.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-f78a7fa7004025b1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-e69d0cdbcb95d548.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-64197a661b14c9f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-5cfbd215f6ccbfed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### Mysql安全
![image.png](https://upload-images.jianshu.io/upload_images/3098875-018d6df0a7027613.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-a5fd61c3049c8797.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-4dd473e5eeb19549.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-8ba6d31fc49266cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)










