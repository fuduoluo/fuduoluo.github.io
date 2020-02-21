---
title: requireJS入门学习
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 5422b83b
date: 2019-07-11 22:43:59
updated: 2019-07-11 22:43:59
categories:  requireJS
tags:  requireJS入门与使用
subtitle:
cover: data:image/png;base64,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
---
<meta name="referrer" content="never">

```
RequireJS是一个JavaScript文件和模块加载器。 
它针对浏览器内使用进行了优化，但可以在其他JavaScript环境中使用，例如Rhino和Node。
 使用像RequireJS这样的模块化脚本加载器可以提高代码的速度和质量。

异步加载的问题，简单点来说就是一个模块没有加载完，
这个模块的function就被调用，那就悲剧了。解决这个有两个方法，一个是定义OnError， 
这个参数是RequireJS调用出错的时候生效。

```
<!--more-->

#### 1.下载文件
[下载文件地址]([https://requirejs.org/docs/download.html](https://requirejs.org/docs/download.html))
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/requirejs/3098875-04cd66ccb7b083a8%20.png)


#### 理解概念
```
require([],function(){}) //个人理解 加载其他js
define //定义依赖关系
```

#### 2.加载js文件
```
<!--这将baseUrl(主入口)设置为“scripts”目录，并且 加载一个模块ID为'main'的脚本-->
<!--也可以手动配置配置文件-->
如果没有使用data-main作为主入口，默认的baseUrl是运行requireJS脚本所在的HTML页面路径
(默认值是加载require.js的HTML所处的位置)
<script data-main="scripts/main.js" src="scripts/require.js"></script>

注意：RequireJS默认假定所有的依赖资源都是js脚本，
因此无需在module ID上再加".js"后缀，RequireJS在进行module ID到path的解析时会自动补上后缀。
```
#### 目录结构
```
//以TP5框架为例：
www/
   index.html
   js/   ---//js项目总目录
    app/
      sub.js
    lib/  ---//项目第三方库
      jquery.js
      canvas.js
    app.js
    require.js
```
#### 目录结构解析
```
-----栗子：
index.html

<script data-main="js/app.js" src="js/require.js"></script>

js/app.js

requirejs.config({
    //默认情况下从js / lib加载任何模块ID。
    baseUrl: 'js/lib',
      //除了，如果模块ID以“app”开头，   
     //从js / app目录加载它
     // paths config相对于baseUrl，
     //依赖资源都是js脚本,无需在module ID上再加".js"后缀
     //路径配置可以用于整个目录。
    paths: {
        app: '../app'
    }
});

//引入依赖app.js启动等其他js。
requirejs(['jquery', 'canvas', 'app/sub'],function   ($,  canvas,   sub) {
      // jQuery，canvas和app / sub模块都是已加载，现在可在此处使用。
    //可以使用已加载js文件方法，属性等
});
```
#### 3.配置项
[配置项学习入口](https://segmentfault.com/a/1190000002401665)


#### 配置文件位置
```
在引用requirejs上面

<script src="scripts/require.js"></script>
<script>
  require.config({
    baseUrl: "/another/path",
    paths: {
        "some": "some/v1.0"
    },
    waitSeconds: 15
  });

require( ["some/module", "my/module", "a.js", "b.js"],
    function(someModule,    myModule) {
        //This function will be called when all the dependencies
        //listed above are loaded. Note that this function could
        //be called before the page is loaded.
        //This callback is optional.
    }
  );
</script>

在引用requirejs下面

<script>
    var require = {
        baseUrl: "/another/path",
        paths: {
            "some": "some/v1.0"
        },
     deps: ["some/module1", "my/module2", "a.js", "b.js"],
        callback: function(module1, module2) {
            //This function will be called when all the dependencies
            //listed above in deps are loaded. Note that this
            //function could be called before the page is loaded.
            //This callback is optional.
        }
        waitSeconds: 15
    };
</script>
<script src="scripts/require.js"></script>
```

#### 注意
1.配置文件单独成一个文件，不要跟具体的业务模块耦合。
2.最好使用 var require = {} 的形式而不是 window.require = {}的形式。后者在IE中运行不正常。

#### urlArgs
```
RequireJS获取资源时附加在URL后面的额外的query参数。
作为浏览器或服务器未正确配置时的“cache bust”手段很有用。使用cache bust配置的一个示例：
urlArgs: "bust=" +  (new Date()).getTime()
在开发中这很有用，但请记得在部署到生成环境之前移除它。

在fa配置文件中使用如下：

 urlArgs: "v=" + requirejs.s.contexts._.config.config.site.version,
```
#### map
```
map: {
    '<module name>': {
        '<Id>': '<JS file>'
    }
}
//这里<module name>是一个已经存在的模块js文件，或者你可以使用'*'。这里Id用于别名JS文件。
```
#### config：
```
当您要将某些配置传递给所有模块时使用。这些值是所有模块的通用值
现在，在您的js文件中，您可以使用以下命令访问此值:require.s.contexts._.config
var config = {
    "map": {
        '*': {
            'sample': 'sample1.js'
        }
    }
    config: {
        "testData":{
            "color":'red'
        }
    }
};
console.log(require.s.contexts._.config.testData.color);

在fa中使用如下:
<script type="text/javascript">
    var require = {
        config:  {$config|json_encode}
    };
 requirejs.s.contexts._.config.xx.xx.xx 这个是直接把requirejs的对象暴露出来  ！！！主要是配置文件信息的读取！
</script>

```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/requirejs/3098875-8680f34e113bc88d%20.png)

#### deps：表示当前模块需要依赖哪些库

#### exports:暴露的全局名称

#### shim:配置没有使用define的依赖js文件
```
当有一些脚本时，它们用于你想要全局声明的那些脚本，以及那些不使用define（）来定义值的脚本，
如果那些脚本已经使用了define（）那么它将无法正常工作。
var config = {
    "shim": {
        "sample": {
        //配置方式一：deps为模块名称，jquery为依赖的js模块
            "deps": ["jquery"],
            "exports": webkulSample
        }
    }
}
exports是一个函数而非是字符串，暴露接口全局使用
var config = {
    "shim": {
  //配置方式二：deps为模块名称，deps为配置依赖的js模块，deps数组，表明该模块的依赖性
        "sample": {
            "deps": ["jquery"],
            "exports": webkulSample,
            init: function (jquery) {
                return this.webkulSample.noConflict;
            }
        }
    }
}
init:当加载多个模块的时候存在名字冲突的可能,比如JQuery、UnderScore等框架都会提供一个noConflict()函数来避免名字冲突

这里，依赖关系是jquery，应该在sample.js之前加载。
在这里，我们使用webkulSample作为全局模块。
导出后调用init函数，在此我们可以编写冲突或清理代码，在此函数中将所有依赖关系作为参数，并且此函数的返回对象覆盖“exports”中定义的字符串

暴露全局栗子：
参考fast.js  ---- window.Fast = Fast;
```

[noConflict()题外话](https://blog.csdn.net/aitangyong/article/details/44200751)


[关于$.extend()用法总结](https://www.cnblogs.com/yuqingfamily/p/5775950.html)
```
1.jQuery.extend(object); 
为扩展jQuery类本身.为类添加新的方法。 
为jQuery类添加类方法，可以理解为添加静态方法。

栗子①：

jQuery.extend({
    min: function(a, b) {
        return a < b ? a : b;
    },
    max: function(a, b) {
        return a > b ? a : b;
    }
});
jQuery.min(2, 3); //  2 
jQuery.max(4, 5); //  5

2.jQuery.fn.extend(object); //给jQuery对象添加方法。
// 为jQuery类添加“成员函数”。jQuery类的实例才可以调用这个“成员函数”。
栗子②
//开发一个插件，做一个特殊的编辑框，当它被点击时，便alert 当前编辑框里的内容
$.fn.extend({
    alertWhileClick: function() {
        $(this).click(function() {
            alert($(this).val());
        });
    }
});
//$("#input1")是jQuery的实例，调用这个扩展方法
$("#input1").alertWhileClick();

```
trigger()

```
trigger() 方法触发被选元素的指定事件类型。
```

#### 前言
```
主要是了解后台模块使用requireJs怎么引用其他js

理解比较有限，不足之处望指点
```
[点击进入....官方文档入口](https://doc.fastadmin.net/docs/index.html)
<!--more-->
#### 1.目录
![image.png](https://upload-images.jianshu.io/upload_images/3098875-75f15b0f93c6b0b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 2.主入口文件
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

#### JS语言包加载
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

#### Object.keys(obj)
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






