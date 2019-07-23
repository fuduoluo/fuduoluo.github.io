---
title: scrollTop、offsetHeight和offsetTop等属性用法详解以及兼容性的解决
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: eb4f2f6e
date: 2019-07-11 23:16:37
updated: 2019-07-11 23:16:37
categories: Javascript滚动事件
tags: jquery,Css操作
subtitle:
---
<blockquote class="blockquote-center">scrollTop、offsetHeight和offsetTop等属性用法详解以及兼容性的解决</blockquote>

>参考文章：
https://www.jianshu.com/p/d267456ebc0d
https://www.imooc.com/article/17571
<!--more-->
![image.png](https://upload-images.jianshu.io/upload_images/3098875-9c8309e7f4721ee5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![image.png](https://upload-images.jianshu.io/upload_images/3098875-5482373cea82b41b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-f79c00caa1c517fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 详解：
>1.scrollHeight:所有的内容(包括肉眼看不见、溢出、被窗口遮挡的部分；)

>2.clientHeight:野内可见的内容和内边距，不包括x轴的滚动条高度、边框、外边距(可见区域的底部左右滚动条不算)------元素宽高+Padding

#### clientHeight不包括border、水平滚动条、margin的元素的高度。对于inline的元素这个属性一直是0，单位px，只读元素


![image.png](https://upload-images.jianshu.io/upload_images/3098875-33eaea347fc2c021.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>3.offsetHeight:在clientHeight的基础上， 加上边框和滚动条的高度------元素宽高+Padding+margin

#### offsetHeight不包括margin的元素的高度。对于inline的元素这个属性一直是0，单位px，只读元素。

>4.scrollTop: 在clientHeight区内滚动条滚动了多少距离（包括之前已滚动过的隐藏内容）

![image.png](https://upload-images.jianshu.io/upload_images/3098875-662f5cebbf36bd00.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-e9058c7980cd0397.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>5.scrollTop: 代表在有滚动条时，滚动条向下滚动的距离也就是元素顶部被遮住部分的高度。在没有滚动条时scrollTop==0恒成立。单位px，可读可设置。
>6.offsetTop: 当前元素顶部距离最近父元素顶部的距离,和有没有滚动条没有关系。单位px，只读元素。

