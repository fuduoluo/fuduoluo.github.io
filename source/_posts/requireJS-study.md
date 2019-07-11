---
title: requireJS入门学习
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 5422b83b
date: 2019-07-11 22:43:59
updated: 2019-07-11 22:43:59
categories:  requireJS入门学习
tags:  requireJS入门学习
subtitle:
---
##### 总述：
```
RequireJS是一个JavaScript文件和模块加载器。 
它针对浏览器内使用进行了优化，但可以在其他JavaScript环境中使用，例如Rhino和Node。
 使用像RequireJS这样的模块化脚本加载器可以提高代码的速度和质量。

异步加载的问题，简单点来说就是一个模块没有加载完，
这个模块的function就被调用，那就悲剧了。解决这个有两个方法，一个是定义OnError， 
这个参数是RequireJS调用出错的时候生效。

```
<!--more-->
##### 1.下载文件
[下载文件地址]([https://requirejs.org/docs/download.html](https://requirejs.org/docs/download.html))
![image.png](https://upload-images.jianshu.io/upload_images/3098875-04cd66ccb7b083a8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


##### 理解概念
```
require([],function(){}) //个人理解 加载其他js
define //定义依赖关系
```

##### 2.加载js文件
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
###### 目录结构解析
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
###### 3.配置项
[配置项学习入口](https://segmentfault.com/a/1190000002401665)


###### 配置文件位置
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

-------使用视业务逻辑需求--------
```
###### 注意
1.配置文件单独成一个文件，不要跟具体的业务模块耦合。
2.最好使用 var require = {} 的形式而不是 window.require = {}的形式。后者在IE中运行不正常。

###### urlArgs
```
RequireJS获取资源时附加在URL后面的额外的query参数。
作为浏览器或服务器未正确配置时的“cache bust”手段很有用。使用cache bust配置的一个示例：
urlArgs: "bust=" +  (new Date()).getTime()
在开发中这很有用，但请记得在部署到生成环境之前移除它。

在fa配置文件中使用如下：

 urlArgs: "v=" + requirejs.s.contexts._.config.config.site.version,
```
###### map
```
map: {
    '<module name>': {
        '<Id>': '<JS file>'
    }
}
//这里<module name>是一个已经存在的模块js文件，或者你可以使用'*'。这里Id用于别名JS文件。
```
###### config：
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
![image.png](https://upload-images.jianshu.io/upload_images/3098875-8680f34e113bc88d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### deps：表示当前模块需要依赖哪些库

###### exports:暴露的全局名称
###### shim:配置没有使用define的依赖js文件
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
>JS小记
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
>trigger()
```
trigger() 方法触发被选元素的指定事件类型。
```






