---
title: fastadmin之PHP小记
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: d8c6d5c6
date: 2019-06-04 00:11:27
updated: 2019-07-22 00:27:11
subtitle:
categories: fastadmin
tags: fastadmin之PHP
top: 
---


##### 1.list()
```
fa中使用：
list($where, $sort, $order, $offset, $limit) = $this->buildparams(NULL)；
list() 函数用于在一次操作中给一组变量赋值。
--通过buildparams函数把参数传递到list进行赋值

栗子：
$my_array = array("Dog","Cat","Horse");
list($a, $b, $c) = $my_array;
echo "I have several animals, a $a, a $b and a $c.";
// I have several animals, a Dog, a Cat and a Horse.
```
<!--more-->
##### 2.标签位
```
1.可以设置行为的位置
2.可以理解为标签位[适合放置地雷的地方]绑定行为[放一颗地雷, 留一根线链着标签]
```
###### 2.1扩展理解
- 钩子(中间件)：应用前后,模型,控制器初始化前后等想做的一些事情提供了便利的行为
[标签位栗子](https://blog.csdn.net/lovemyself196221/article/details/78183699)
[行为(钩子)具体使用查看TP5官网](https://www.kancloud.cn/manual/thinkphp5/118130)
[fastadmin新增标签位](http://doc.fastadmin.net/docs/addons.html#%E7%9B%AE%E5%BD%95%E4%BB%8B%E7%BB%8D-2)

##### 3.
```
sprintf() 
<?php
$number = 2;
$str = "Shanghai";
$txt = sprintf("There are %u million cars in %s.",$number,$str);
echo $txt;
?>
把百分号（%）符号替换成一个作为参数进行传递的变量,把格式化的字符串写入变量中

常用的格式值：
%% - 返回一个百分号 %
%b - 二进制数
%c - ASCII 值对应的字符
%d - 包含正负号的十进制数（负数、0、正数）
%e - 使用小写的科学计数法（例如 1.2e+2）
%E - 使用大写的科学计数法（例如 1.2E+2）
%u - 不包含正负号的十进制数（大于等于 0）
%f - 浮点数（本地设置）
%F - 浮点数（非本地设置）
%g - 较短的 %e 和 %f
%G - 较短的 %E 和 %f
%o - 八进制数
fa中使用 ----> %s - 字符串
%x - 十六进制数（小写字母）
%X - 十六进制数（大写字母）
```
##### 4.有趣的PHP赋值运算，位运算符
```
<?php
            $a=3;
            $b=5;
            dump($a);//3
            dump($b);//5
//          以上是赋值$a $b
        if ($a = 5 || $b = 7) {
//            首先|| 优先级比= 高
//            所以以上条件相当与于  => if($a = (5 || $b = 7))
//            || 如A或者B至少有一个满足条件才能执行某一结果
            dump($a);//true  => 1
            dump($b);// 5
            dump($a.$b); //15
```
##### 5.PHP版本出现错误
![弃用-方法名和类名一样的构造函数](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/fastadmin/3098875-b4bd5a143605e8f6.png)

![文档说明](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/fastadmin/3098875-4c52a07f6ec7e856.png)
##### 6.http_build_query偶遇
##### 用 http_build_query 对 url 进行编码：
- http_build_query 可以将一维或多维 数组/对象 进行 url_encode 编码，并返回编码后的字符串。
- 无论传入的数据是数组还是 object，解码后都将转换为数组。
[具体了解，戳这里！](https://www.jianshu.com/p/5e9239e44eb8)



