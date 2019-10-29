---
title: IO
permalink: 'posts/:abbrlink.html'
copyright: true
categories: IO阻塞线程同步
tags: IO阻塞线程同步
abbrlink: 8601bab2
date: 2019-10-29 16:55:50
updated: 2019-10-29 16:55:50
subtitle:
---
<meta name="referrer" content="never">
<blockquote class="blockquote-center">IO 进程线程、同步异步、阻塞非阻塞、并发并行</blockquote>

 [15分钟读懂进程线程、同步异步、阻塞非阻塞、并发并行](https://www.cnblogs.com/mhq-martin/p/9035640.html)

###### 同步/异步关注的是消息通知的机制，而阻塞/非阻塞关注的是程序（线程）等待消息通知时的状态。
##### 同步 
就是我调用一个功能，该功能没有结束前，我死等结果。
```
例如表单提交，没有返回结果之前，浏览器不能去执行其他的操作
```
##### 异步 
我调用一个功能，不需要知道该功能结果，该功能有结果后通知我（回调通知）
```
例如ajax发送请求，回调函数没有返回请求结果之前浏览器可以去执行其他操作
```
##### 阻塞 
调用我（函数），我（函数）没有接收完数据或者没有得到结果之前，我不会返回。
<!--more-->
##### 非阻塞
调用我（函数），我（函数）立即返回，通过状态、通知和回调来通知调用者。

同步IO和异步IO的区别就在于：数据拷贝的时候进程是否阻塞
阻塞IO和非阻塞IO的区别就在于：应用程序的调用是否立即返回

##### linux的五种IO模型

- 阻塞I/O（blocking I/O）
- 非阻塞I/O （nonblocking I/O
-  I/O复用(select 和poll)（I/O multiplexing） 
- 信号驱动I/O （signal driven I/O (SIGIO)）
- 异步I/O （asynchronous I/O (the POSIX aio_functions)）
```
前4种都是同步，最后一种才是异步
```
