---
title: ES6
permalink: 'posts/:abbrlink.html'
top_img: https://i.loli.net/2020/03/20/laLpVHNxdgWDsJf.png
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://i.loli.net/2020/03/20/laLpVHNxdgWDsJf.png
abbrlink: 42b82995
date: 2020-01-19 14:40:36
updated: 2020-02-20 11:27:09
tags: ES6
categories: ES6
keywords: ES6
description:
---

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
记录不理解的地方
{% endnote %}

https://blog.techbridge.cc/2017/04/22/javascript-prototype/
https://www.cnblogs.com/douyage/p/8630529.html

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
#### 数组解构
    {% note info %}
    左边模式等于右边模式
    {% endnote %}

- 完全解构:属于“模式匹配”，只要等号两边的模式相同
    ```
    let [x, y, ...z] = ['a'];
    x // "a"
    y // undefined
    z // []

    let [ , , third] = ["foo", "bar", "baz"];
    third // "baz"

    ```
- 不完全解构:等号左边的模式，只匹配一部分的等号右边的数组
    ```
    let [x, y] = [1, 2, 3];
    x // 1
    y // 2

    // 报错：等号的右边不是数组（或者严格地说，不是可遍历的结构）
    let [foo] = 1;
    let [foo] = false;
    let [foo] = NaN;
    let [foo] = undefined;
    let [foo] = null;
    let [foo] = {};


    ```
- 默认值
    {% note warning %}
    ES6 内部使用严格相等运算符（===），判断一个位置是否有值
    只有当一个数组成员严格等于undefined，默认值才会生效。
    默认值是一个表达式只有在用到的时候，才会求值。
    引用解构赋值的其他变量，但该变量必须已经声明。
    {% endnote %}

    ```
    let [x = 1] = [undefined];
    x // 1

    let [x = 1] = [null];
    x // null

    //表达式
    function f() {
      console.log('aaa');
    }
    let [x = f()] = [1];
    x // 1

    变量声明与未声明变量
    let [x = 1, y = x] = [];     // x=1; y=1
    let [x = y, y = 1] = [];     // ReferenceError: y is not defined
    ```
- 解构失败：变量的值就等于undefined
    ```
    let [foo] = [];
    let [bar, foo] = [1];
    foo //undefined
    ```

#### 对象解构

{%  note success %}

    区别：数组的元素是按次序排列的，变量的取值由它的位置决定；
    而对象的属性没有次序，变量必须与属性同名，才能取到正确的值
    解构失败：变量的值等于undefined.
    对象的解构赋值的内部机制，是先找到同名属性，然后再赋给对应的变量。真正被赋值的是后者，而不是前者
        
{% endnote %}

- 对象的属性没有次序，变量必须与属性同名，才能取到正确的值反之出现undefined
    ```
    let { bar, foo } = { foo: 'aaa', bar: 'bbb' };
    foo // "aaa"
    bar // "bbb"

    let { baz } = { foo: 'aaa', bar: 'bbb' };
    baz // undefined
    
    ```

- 对象方法也可以赋值到某一个变量

    ```
    const { log } = console;
    log('hello') // hello  将console.log赋值到log变量
    ```
- 变量名与属性名不一致时，可以改写如下达到解构成功
    ```
    foo 匹配模式  baz 变量  真正被赋值是baz
    let { foo: baz } = { foo: 'aaa', bar: 'bbb' };
    baz // "aaa"

    ```
- 对象解构也可以用于嵌套结构
    ```
    let obj = {
        p: [
            'Hello',
            { y: 'World' }
        ]
    };

    let { p: [x, { y }] } = obj;
    x // "Hello"
    y // "World"
    
    注意p 不是变量 是属于匹配模式
    如果p也要作为变量赋值
    let { p,p: [x, { y }] } = obj;
    x // "Hello"
    y // "World"
    p // ["Hello", {y: "World"}]
    ```
- 默认值：只有对象属性值是undefined才会生效
    ```
    var {x = 3} = {x: undefined};
    x // 3

    var {x = 3} = {x: null};
    x // null
    ```
#### 用途
[点击这里](http://es6.ruanyifeng.com/#docs/destructuring#%E7%94%A8%E9%80%94)

#### 扩展运算符

    {% note success%}
    扩展运算符（spread）是三个点（...）。它好比 rest 参数的逆运算，将一个数组转为用逗号分隔的参数序列
    {% endnote %}

    ```
    console.log(...[1, 2, 3])
    // 1 2 3

    console.log(1, ...[2, 3, 4], 5)
    // 1 2 3 4 5
    
    ```

- 运算符主要用于函数调用
    ```
    function push(array, ...items) {
        array.push(...items);
    }

    ```
- 放置表达式
    ```
    const arr = [
        ...(x > 0 ? a : ""),
        'b',
    ];
    ```
- 扩展运算符后面是一个空数组，则不产生任何效果
    ```
    [...[], 1]
    // [1]  
    ```
- 代替apply
    ```
    // ES5 的写法
    Math.max.apply(null, [1, 3, 7])

    // ES6 的写法
    Math.max(...[1, 3, 7])

    // 等同于
    Math.max(1, 3, 7);
    通过push函数，将一个数组添加到另一个数组的尾部
    // ES5的 写法
    var arr1 = [0, 1, 2];
    var arr2 = [3, 4, 5];
    Array.prototype.push.apply(arr1, arr2);

    // ES6 的写法
    let arr1 = [0, 1, 2];
    let arr2 = [3, 4, 5];
    arr1.push(...arr2);
    ```
##### 扩展运算符应用
[点击这里](http://es6.ruanyifeng.com/#docs/array#%E6%89%A9%E5%B1%95%E8%BF%90%E7%AE%97%E7%AC%A6%E7%9A%84%E5%BA%94%E7%94%A8)


#### Prototype 属性
##### 构造函数
{% note info %}
构造函数的特点有：

　　　　a：构造函数的函数名首字母必须大写。

　　　　b：内部使用this对象，来指向将要生成的对象实例。

　　　　c：使用new操作符来调用构造函数，并返回对象实例
{% endnote %}
- 出现原因：


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


#### 箭头函数[胖箭头函数]

##### 出现原因：

> 解决传统函数语法的灵活性
>
> 一种函数表达式的简写

> [ES6之阮一峰大神](https://es6.ruanyifeng.com/)

> [大彬哥-箭头函数](https://segmentfault.com/a/1190000019102902)

> [两个例子明白箭头函数this指向](https://blog.csdn.net/w390058785/article/details/82884032)


- 节省大量代码

- 解决输入function () {}错误导致的错误

##### 用法：

```js
ES5写法：求和
var sum = function(x, y) {
    return x + y
}
```

> => 代替关键词 function

```js
var sum = (x,y)=>{
	return x + y
}
```

> 函数体只有一条返回语句时，省略口号{}和return关键字

```js
var sum  = (x,y) => x+y
```

##### 处理简单函数:过滤

```js 
// ES5
var array = ['1', '2345', '567', '89'];
array = array.filter(function (item) {
    return item.length > 2;
});
// ["2345", "567"]


// ES6
let array = ['1', '2345', '567', '89'];
array = array.filter(item => item.length > 2); 
// ["2345", "567"]
```

##### 箭头函数主要使用模式：

```js
//  一个参数对应一个表达式
param => expression;// 例如 x => x+2;

// 多个参数对应一个表达式
(param [, param]) => expression; //例如 (x,y) => (x + y);

// 一个参数对应多个表示式
param => {statements;} //例如 x = > { x++; return x;};

//  多个参数对应多个表达式
([param] [, param]) => {statements} // 例如 (x,y) => { x++;y++;return x*y;};

//表达式里没有参数
() => expression; //例如var flag = (() => 2)(); flag等于2

() => {statements;} //例如 var flag = (() => {return 1;})(); flag就等于1

 //传入一个表达式，返回一个对象
([param]) => ({ key: value });
//例如  var fuc = (x) => ({key:x})
        var object = fuc(1);
        alert(object);//{key:1}
```

##### 关于this指向问题

[执行上下文详解](http://caibaojian.com/js-call-stack.html)

> 执行上下文：评估和执行 [JavaScript](http://caibaojian.com/t/javascript) 代码的环境的抽象概念

1. **全局执行上下文**
2. **函数执行上下文**
3. **Eval 函数执行上下文**

!![image.png](https://upload-images.jianshu.io/upload_images/3098875-aaf28e2a6c5692c8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

有1个全局上下文(Global Context)，使用紫色边框表示；

有3个不同的函数上下文(Function Context)由绿色，蓝色，和橙色边框表示。

> 注意！全局上下文有且只有一个，程序中其他任意的上下文都可以访问全局上下文

##### this绑定：

> 在全局执行上下文中，`this` 的值指向全局对象。(在浏览器中，`this`引用 Window 对象)。

> 在函数执行上下文中，`this` 的值取决于该函数是如何被调用的。
>
> 如果它被一个引用对象调用，那么 `this` 会被设置成那个对象，
>
> 否则 `this` 的值被设置为全局对象或者 `undefined`（在严格模式下）

```js
let foo = {
  baz: function() {
  console.log(this);
  }
}
foo.baz();   // 'this' 引用 'foo', 因为 'baz' 被
             // 对象 'foo' 调用
let bar = foo.baz;
bar();       // 'this' 指向全局 window 对象，因为
             // 没有指定引用对象
```

##### [作用域](https://www.cnblogs.com/henyulee/p/8484122.html)

1. 全局作用域
2. 局部作用域

![image.png](https://upload-images.jianshu.io/upload_images/3098875-ef4406f54458d284.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a76b86c263cf5500.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### ES6箭头函数

> 箭头函数内的this值继承自外围作用域。运行时它会首先到它的父作用域找，如果父作用域还是箭头函数，那么接着向上找，直到找到我们要的this指向。

> 箭头函数的this在声明时指向`window`，在调用时指向声明时所在的上下文`this`

[阮一峰之箭头函数this讲解]([https://es6.ruanyifeng.com/?search=%E7%AE%AD%E5%A4%B4%E5%87%BD%E6%95%B0&x=0&y=0#docs/function#%E7%AE%AD%E5%A4%B4%E5%87%BD%E6%95%B0](https://es6.ruanyifeng.com/?search=箭头函数&x=0&y=0#docs/function#箭头函数))

> `箭头函数this`对象，就是定义时所在的对象，而不是使用时所在的对象。

![image.png](https://upload-images.jianshu.io/upload_images/3098875-f580708d967a8342.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)