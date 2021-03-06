---
title: Linux IO模型

copyright: true
categories: IO
tags: Linux
abbrlink: 8601bab2
date: 2019-10-29 16:55:50
updated: 2019-10-29 16:55:50
subtitle:
cover: https://i.loli.net/2020/03/22/yzDGjLfZMEelvWI.jpg
---

<blockquote class="blockquote-center">IO 进程线程、同步异步、阻塞非阻塞、并发并行</blockquote>

#### 用户空间和内核空间
- 现代操作系统采用虚拟存储器, 那么对32位操作系统而言, 它的寻址空间(虚拟存储空间)为4G(2^32)
操作系统的核心是内核, 不同于普通的应用程序, 内核可以访问受保护的内存空间, 也拥有访问底层硬件设备的所有权限

为了防止用户进程直接操作内核, 保证内核的安全

- 操作系统：将虚拟空间分为：内核和用户

- 内核空间：对Linux系统而言, 将最高的1GB字节(从虚拟地址0xC0000000~0xFFFFFFFF), 供内核使用

- 用户空间：较低的3GB字节(从虚拟地址0x00000000~0xB0000000), 供各个进程使用

Linux的一次IO操作，分为两个阶段： 

- (1)内核空间准备数据

- (2)将数据从内核空间缓冲区拷贝到用户空间缓冲区

![IO操作过程](https://raw.githubusercontent.com/duiying/img/master/LinuxIO.png)
#### 进程切换
- 什么是进程切换

 为了控制进程的执行, 内核必须有能力挂起正在CPU上运行的进程, 并恢复以前挂起的某个进程的执行的行为。
- 什么是PCB（process controlle block）

系统为了管理进程设置的一个专门的数据结构

PCB(进程控制块)是系统感知进程存在的唯一标志

- 进程切换的过程

1. 保存处理机上下文, 包括程序计数器和其他寄存器
2. 更新PCB信息
3. 将进程的PCB移入相应的队列, 如就绪、在某事件阻塞等队列
4. 选择另一个进程执行, 并更新其PCB
5. 更新内存管理的数据结构
6. 恢复处理机上下文

#### 进程阻塞

正在执行的进程, 由于期待的某些事件未发生, 
如请求资源失败、等待某种操作的完成、新数据尚未到达或无新工作做等,
则由系统自动执行阻塞原语(Block), 使自己由运行状态变为阻塞状态

- 特征：

1. 只有处于运行状态的进程(获得CPU), 才能被阻塞
2. 进程的阻塞是进程自身的一种主动行为
3. 当进程进入阻塞状态, 不占用CPU资源

#### 文件描述符 file descriptor

每个进程在PCB中保存着一份文件描述符表, 文件描述符表中每一项都有一个指向已打开文件的指针
文件描述符表的索引就是文件描述符
当程序打开一个现有文件或者创建一个新文件时, 内核向进程返回一个文件描述符

![文件描述符](https://raw.githubusercontent.com/duiying/img/master/linux-fd.png)

 [15分钟读懂进程线程、同步异步、阻塞非阻塞、并发并行](https://www.cnblogs.com/mhq-martin/p/9035640.html)
 [nginx、swoole高并发原理初探](https://mp.weixin.qq.com/s/WMi7LZj0bqXa72V9fRhwCA)

#### 同步/异步关注的是消息通知的机制，而阻塞/非阻塞关注的是程序（线程）等待消息通知时的状态。
#### 同步 
就是我调用一个功能，该功能没有结束前，我死等结果。
```
例如表单提交，没有返回结果之前，浏览器不能去执行其他的操作
```
#### 异步 
我调用一个功能，不需要知道该功能结果，该功能有结果后通知我（回调通知）
```
例如ajax发送请求，回调函数没有返回请求结果之前浏览器可以去执行其他操作
```
#### 阻塞 
调用我（函数），我（函数）没有接收完数据或者没有得到结果之前，我不会返回。
<!--more-->
#### 非阻塞
调用我（函数），我（函数）立即返回，通过状态、通知和回调来通知调用者。

同步IO和异步IO的区别就在于：数据拷贝的时候进程是否阻塞
阻塞IO和非阻塞IO的区别就在于：应用程序的调用是否立即返回

#### linux的五种IO模型

- 阻塞I/O（blocking I/O）
- 非阻塞I/O （nonblocking I/O
-  I/O复用(select 和poll)（I/O multiplexing） 
- 信号驱动I/O （signal driven I/O (SIGIO)）
- 异步I/O （asynchronous I/O (the POSIX aio_functions)）
```
前4种都是同步，最后一种才是异步
```