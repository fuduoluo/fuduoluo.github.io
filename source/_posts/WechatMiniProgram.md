---
title: 微信小程序
permalink: 'posts/:abbrlink.html'
top_img: https://img4.mukewang.com/5bbf2def000118ab06000336-240-180.jpg
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: 'https://img4.mukewang.com/5bbf2def000118ab06000336-240-180.jpg'
categories: wechat
keywords: WeChat 小程序 微信
description: 日常记录开发小程序点滴
abbrlink: 538b2da9
date: 2019-12-30 10:04:16
updated: 2019-12-30 10:04:16
tags:
---

<blockquote class="blockquote-center"></blockquote>
{% note success %}
记录微信小程序学习
{% endnote %}

#### 开发小程序前的注意事项

[小程序开发注意事项](https://cloud.tencent.com/developer/article/1552955)
#### 如何规范设置的小程序名称、简称
[规范命名小程序](https://developers.weixin.qq.com/community/develop/doc/0004221455ce78d413893d4b75b009?highLine=%25E7%2594%25B3%25E8%25AF%25B7%25E5%25A4%259A%25E4%25B8%25AA%25E5%25B0%258F%25E7%25A8%258B%25E5%25BA%258F)

#### 微信小程序发布流程
[发布流程](https://www.jianshu.com/p/a77b73f329e4)

#### Promise含义
- 异步编程的一种解决方案
- 是一个容器，里面保存着某个未来才会结束的事件（通常是一个异步操作）的结果
- 语法上说，Promise 是一个对象，从它可以获取异步操作的消息
#### Promise对象
-  一个构造函数，用来生成Promise实例
##### 特点
- 对象的状态不受外界影响。
    - 其代表是一个异步操作
    - 状态：pending（进行中）、fulfilled（已成功）和rejected（已失败）
- 一旦状态改变，就不会再变，任何时候都可以得到这个结果。
    - 状态改变：从pending变为fulfilled和从pending变为rejected。只要这两种情况发生，状态就凝固了，不会再变了，会一直保持这个结果，这时就称为 resolved（已定型）
    - resolved统一只指fulfilled状态
#### Promise 用法
- Promise构造函数接受一个函数作为参数，该函数的两个参数分别是resolve和reject
- Promise实例生成以后，可以用then方法分别指定resolved状态和rejected状态的回调函数
```
    const promise = new Promise(function(resolve, reject) {
    // ... some code

    if (/* 异步操作成功 */){
        resolve(value);
    } else {
        reject(error);
    }
    });

    promise.then(function(value) {
        // success
    }, function(error) {
        // failure
    });
```
#### async
-  https://es6.ruanyifeng.com/#docs/async
-  就是 Generator 函数的语法糖
-  返回一个Promise对象
-  async函数内部return语句返回的值，会成为then方法回调函数的参数。
-  只有async函数内部的异步操作执行完，才会执行then方法指定的回调函数。
#### async function语法
- 自动将常规函数转换成Promise，返回值也是一个Promise对象

- 只有async函数内部的异步操作执行完，才会执行then方法指定的回调函数

- 异步函数内部可以使用await
#### await
- await 放置在Promise调用之前，await 强制后面点代码等待，直到Promise对象resolve，得到resolve的值作为await表达式的运算结果

- await只能在async函数内部使用,用在普通函数里就会报错
#### aysnc用法
 ```
    function timeout(ms) {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    });
    }

    async function asyncPrint(value, ms) {
    await timeout(ms);
    console.log(value);
    }

    asyncPrint('hello world', 50);
 ```
 #### aysnc多种使用形式
 ```
 // 函数声明
async function foo() {}

// 函数表达式
const foo = async function () {};

// 对象的方法
let obj = { async foo() {} };
obj.foo().then(...)

// Class 的方法
class Storage {
  constructor() {
    this.cachePromise = caches.open('avatars');
  }

  async getAvatar(name) {
    const cache = await this.cachePromise;
    return cache.match(`/avatars/${name}.jpg`);
  }
}

const storage = new Storage();
storage.getAvatar('jake').then(…);

// 箭头函数
const foo = async () => {};
 ```
#### 错误处理查看阮一峰老师讲解

#### 小程序Token令牌使用场景
![小程序Token令牌场景使用](https://upload-images.jianshu.io/upload_images/3098875-d088d07a3b75e9b0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- Openid:一个用户针对一个小程序拥有一个Openid,在不同小程序Openid是不一样的
- Unionid:，同一用户，对同一个微信开放平台下的不同应用，UnionID是相同的。用户的UnionID可通过调用“获取用户信息”接口获取。同一个用户在微信体系[微信公众号，小程序，服务号等]下Unionid是一样的

#### 微信支付
![微信支付简易版](https://upload-images.jianshu.io/upload_images/3098875-fb23dbe77a49b791.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
