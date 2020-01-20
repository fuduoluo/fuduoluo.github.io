---
title: ES6
permalink: 'posts/:abbrlink.html'
top_img: https://user-gold-cdn.xitu.io/2019/2/12/168df9eaae700fc2?imageView2/0/w/1280/h/960/format/webp/ignore-error/1
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://user-gold-cdn.xitu.io/2019/2/12/168df9eaae700fc2?imageView2/0/w/1280/h/960/format/webp/ignore-error/1
abbrlink: 42b82995
date: 2020-01-19 14:40:36
updated: 2020-01-19 14:40:36
tags: ES6
categories: ES6
keywords: ES6
description:
---
<meta name="referrer" content="never">
<blockquote class="blockquote-center">图片来自网络</blockquote>

### ES6进化
![ES6进化史](https://user-gold-cdn.xitu.io/2019/12/12/16ef8c13ece2bc0c?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

### 更新
- 表达式：声明、解构赋值
- 内置对象：字符串扩展、数值扩展、对象扩展、数组扩展、函数扩展、正则扩展、Symbol、Set、Map、Proxy、Reflect
- 语句与运算：Class、Module、Iterator
- 异步编程：Promise、Generator、Async

### 总结
{% note primary %}
总结个人常用语法
{% endnote %}

#### rest参数与arguments关键字
- arguments
    {% note warning %}
    arguments，可以获得调用者传入的所有参数
    arguments最常用于判断传入参数的个数
    arguments.length
    {% endnote %}
- rest 
    {% note warning %}
    获得额外的传入js参数
    rest参数只能写在最后，前面用...标识，从运行结果可知，传入的参数先绑定a、b，多余的参数以数组形式交给变量rest
    {% endnote %}
    ```
    function foo(a, b) {
        var i, rest = [];
        if (arguments.length > 2) {
            for (i = 2; i<arguments.length; i++) {
                rest.push(arguments[i]);
            }
        }
        console.log('a = ' + a);
        console.log('b = ' + b);
        console.log(rest);
    }

    function foo(a, b, ...rest) {
        console.log('a = ' + a);
        console.log('b = ' + b);
        console.log(rest);
    }

    foo(1, 2, 3, 4, 5);
    // 结果:
    // a = 1
    // b = 2
    // Array [ 3, 4, 5 ]
    ```


#### 解构赋值
- 传统做法如何把一个数组的元素分别赋值给几个变量
    ```
    var array = ['hello', 'JavaScript', 'ES6'];
    var x = array[0];
    var y = array[1];
    var z = array[2];
    ```
- ES6
    ```
    'use strict';
    // 如果浏览器支持解构赋值就不会报错:
    var [x, y, z] = ['hello', 'JavaScript', 'ES6'];
    ```
    {% note danger %}
    1.注意，对数组元素进行解构赋值时，多个变量要用[...]括起来。
    2.如果数组本身还有嵌套，也可以通过下面的形式进行解构赋值，注意嵌套层次和位置要保持一致
    3.解构赋值还可以忽略某些元素
    {% endnote %}
    ```
    let [x, [y, z]] = ['hello', ['JavaScript', 'ES6']];
    x; // 'hello'
    y; // 'JavaScript'
    z; // 'ES6'

    let [, , z] = ['hello', 'JavaScript', 'ES6']; // 忽略前两个元素，只对z赋值第三个元素
    z; // 'ES6'

   //快速获取对象指定属性
    var person = {
        name: '小明',
        age: 20,
        gender: 'male',
        passport: 'G-12345678',
        school: 'No.4 middle school'
    };
    var {name, age, passport} = person;
    // name, age, passport分别被赋值为对应属性:
    //使用直接用
    console.log('name = ' + name + ', age = ' + age + ', passport = ' + passport);
    
    ```

#### 高阶函数
- map()
![map简单例子](https://upload-images.jianshu.io/upload_images/3098875-c55fda08bd56bf6c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
function pow(x) {
    return x * x;
}
var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
var results = arr.map(pow); // [1, 4, 9, 16, 25, 36, 49, 64, 81]
console.log(results);//1,4,9,16,25,36,49,64,81
```
- reduce()

#### 箭头函数
ES6 允许使用“箭头”（=>）定义函数
```
var f = v => v;

// 等同于
var f = function (v) {
  return v;
};
```

##### 无参数
```
var f = () => 5;
// 等同于
var f = function () { 
    return 5 
};
```

##### 一个参数
```
var f = num => 5;
// 等同于
var f = function (num) { 
    return 5 
};
```

##### 多个参数
```
var sum = (num1, num2) => num1 + num2;
// 等同于
var sum = function(num1, num2) {
  return num1 + num2;
};
```
未完。。。