---
title: fastadmin 加载JS文件，语言包
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 525bc5ee
date: 2019-07-11 22:12:07
updated: 2019-07-11 22:12:07
categories: requireJs
tags: requireJs
subtitle:
---
<blockquote class="blockquote-center">fastadmin的js模块化</blockquote>

###### 前言
```
主要是了解后台模块使用requireJs怎么引用其他js

理解比较有限，不足之处望指点
```
[点击进入....官方文档入口](https://doc.fastadmin.net/docs/index.html)
<!--more-->
###### 1.目录
![image.png](https://upload-images.jianshu.io/upload_images/3098875-75f15b0f93c6b0b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 2.主入口文件
```
1-1.html文件位置(主入口)

-------'admin/view/common/script'

<script src="__CDN__/assets/js/require{$Think.config.app_debug?'':'.min'}.js" data-main="__CDN__/assets/js/require-backend{$Think.config.app_debug?'':'.min'}.js?v={$site.version}">
</script>

1-2.JS文件调用和初始化位置（主入口）：

-------'require-backend.js'

主要参数：
urlArgs:"v=" + requirejs.s.contexts._.config.config.site.version, //版本号
根路径baseUrl：requirejs.s.contexts._.config.config.site.cdnurl + '/assets/js/', //资源基础路径
paths：参考require-backend.js
shim:参考require-backend.js
map: {
        '*': {
            'css': '../libs/require-css/css.min'
        }
    }

其他参数参照'require-backend.js'

该js文件主要作用：
1.初始化暴露配置
2.暴露全局语言包
3.默认加载依赖：'fast' ,'backend', 'backend-init', 'addons'等文件
4.牛逼之处：
//根据js文件名自动加载依赖和控制器
 if (Config.jsname) {
    require([Config.jsname], function (Controller) {
          Controller[Config.actionname] != undefined && Controller[Config.actionname]();
    }, function (e) {
        console.error(e);
      // 这里可捕获模块加载的错误
      });
  }
注意点:
在控制器章节我们有提到每个控制器都对应一个JS模块，控制器名称和JS中模块名称是一一对应的。
如：
以TP5--MVC模型为例
controller层：public function detail(){}
Js文件：var controller = { detail:function(){} }

```
[配置项介绍入口](https://www.jianshu.com/p/37ec668500ae)

#####JS语言包加载
> requirejs.s.contexts._.config.xx.xx.xx 这个是直接把requirejs的对象暴露出来  ！！！主要是配置文件信息的读取！


[ requirejs.s.contexts._.config详解](https://www.jianshu.com/writer#/notebooks/6413971/notes/43642929/preview)

```
   require.backend.js中
    1.初始配置
    var Config = requirejs.s.contexts._.config.config;

    2.将Config渲染到全局
    window.Config = Config;

    3. 配置语言包的路径
    var paths = {};
    paths['lang'] = Config.moduleurl + '/ajax/lang?callback=define&controllername=' + Config.controllername;
    ///模块.php/ajax/lang?callback=define&controllername=控制器名

    4.当您要将某些配置传递给所有模块时使用。这些值是所有模块的通用值--暴露配置语言包
    require.config({paths: paths});

    5.初始化fast.js,调用lang方法，根据C层去找语言包
      lang: function () {
            var args = argument
      }

    lang方法里没有写参数却传入了参数，该如何拿到参数-->argument

    6.在fast.js将语言方法暴露到全局中去
    window.__ = Fast.lang;

    7.require.backend.js初始化主文件加载
    $(function () {
        require(['fast'], function (Fast) {
        });
    });

使用方式：
HTML：{:__('')}
PHP/JS：__('')
```
[JS-arguments讲解](https://www.jianshu.com/p/e6bfa4bdf718)
[JS所有内置对象属性和方法汇总](https://segmentfault.com/a/1190000011467723)
```
    使用栗子：
    function format(string) {
      var args = arguments;
      console.log(arguments);
      var pattern = new RegExp("%([1-" + arguments.length + "])", "g");
      return String(string).replace(pattern, function(match, index) {
        return args[index];
        });   
    };
    format("And the %1 want to know whose %2 you %3", "papers", "shirt", "wear");
    返回：“And the papers want to know whose shirt you wear”
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-b72e10a748525b7e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![image.png](https://upload-images.jianshu.io/upload_images/3098875-6007f5d93b962e63.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### Object.keys(obj)
[参考火狐开发手册](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)
```
解释：
返回一个由一个给定对象的自身可枚举属性组成的数组，
数组中属性名的排列顺序和使用for...in语句，
以任意顺序遍历一个对象自有的、继承的、可枚举的、非Symbol的属性。对于每个不同的属性，语句都会被执行。") 
循环遍历该对象时返回的顺序一致
<script>
// simple array
var arr = ['a', 'b', 'c'];
console.log(Object.keys(arr)); // console: ['0', '1', '2']

// array like object
var obj = { 0: 'a', 1: 'b', 2: 'c' };
console.log(Object.keys(obj)); // console: ['0', '1', '2']

// array like object with random key ordering
var anObj = { 100: 'a', 2: 'b', 7: 'c' };
console.log(Object.keys(anObj)); // console: ['2', '7', '100']
</script>

简单理解
返回obj或者array中的KEY值并按照从小排列
```

