---
title: 归纳总结PHP面试(笔试)

copyright: true
abbrlink: 5c07421a
date: 2019-09-09 20:09:44
updated: 2019-09-09 20:09:44
categories: PHP-interview
tags: PHP面试笔试题
subtitle:
cover: https://i.loli.net/2020/03/22/WFRe4ALGt27wocX.png
---

<blockquote class="blockquote-center">来自网络相关面试题(笔试题) </blockquote>

##### ---PHP基础和进阶知识
###### 超全局变量（8个）
```
$_GET ----->get传送方式
$_POST ----->post传送方式
$_REQUEST ----->可以接收到get和post两种方式的值
$GLOBALS ----->所有的变量都放在里面
$_FILE ----->上传文件使用
$_SERVER ----->系统环境变量
$_SESSION ----->会话控制的时候会用到
$_COOKIE ----->会话控制的时候会用到
```
###### Include require include_once require_once 的区别.
```
处理失败方式不同：
require 失败时会产生一个致命级别错误，并停止程序运行。
include 失败时只产生一个警告级别错误，程序继续运行。
include_once/require_once和include/require 处理错误方式一样，
唯一区别在于当所包含的文件代码已经存在时候，不在包含。
注意:包含文件不存在或者语法错误的时候require是致命的，而include不是
  ● require_once表示了只包含一次，避免了重复包含
```
<!--more-->

###### echo、print_r、print、var_dump之间的区别
```
1. echo、print是php语句，var_dump和print_r是函数
2.echo 输出一个或多个字符串，中间以逗号隔开，
没有返回值是语言结构而不是真正的函数，因此不能作为表达式的一部分使用
3. print也是php的一个关键字，有返回值 只能打印出简单类型变量的值(如int，string)，
如果字符串显示成功则返回true，否则返回false
4.print_r 可以打印出复杂类型变量的值(如数组、对象）
以列表的形式显示，并以array、object开头，
但print_r输出布尔值和NULL的结果没有意义，
因为都是打印"\n"，因此var_dump()函数更适合调试
5.var_dump() 判断一个变量的类型和长度，并输出变量的数值
```
##### 说明php中传值与传引用的区别，并说明传值什么时候传引用？
```变量默认总是传值赋值，当将一个表达式的值赋予一个变量时，整个表达式的值被赋值到目标变量
这意味着：当一个变量的赋予另外一个变量时，改变其中一个变量的值，将不会影响到另外一个变量
php也提供了另外一种方式给变量赋值：引用赋值。
这意味着新的变量简单的__引用__(换言之，成为了其别名或者指向)了原始变量。
改动的新的变量将影响到原始变量，反之亦然。
使用引用赋值，简单地将一个&符号加到将要赋值的变量前(源变量)
对象默认是传引用 对于较大是的数据，传引用比较好，这样可以节省内存的开销
```
###### 用PHP打印出前一天的时间格式是2006-5-10 22:21:21
```
echo date('Y-m-d H:i:s', strtotime('-1 day'))
```
###### 实现中文字串截取无乱码的方法。
```
1.--- mb_substr()
2.function GBsubstr($string, $start, $length) {
	if(strlen($string)>$length){
		$str=null;
		$len=$start+$length;
		for($i=$start;$i<$len;$i++){
		if(ord(substr($string,$i,1))>0xa0){
			$str.=substr($string,$i,2);
			$i++;
		}else{
			$str.=substr($string,$i,1);
		}
		}
		return $str.’…’;
	}else{
		return $string;
	}
}
```
###### 如何用php的环境变量得到一个网页地址的内容？ip地址又要怎样得到？
```
$_SERVSR[‘REQUEST_URI’] , $_SERVER[‘REMOTE_ADDR’]
```
###### 字符串翻转

```
strrev函数
function  strrev($str)  
   {  
     $len=strlen($str);  
       $newstr = '';  
    for($i=$len;$i>=0;$i--)  
       {  
          $newstr .= $str{$i};  
      }  
     return $newstr;  
  }  
```
###### 求两个日期的差数，例如2007-2-5 ~ 2007-3-6 的日期差数
```
(strtotime(‘2007-3-6’)-strtotime(‘2007-2-5’))/3600*24
```

##### ---Mysql知识相关

###### Mysql 的存储引擎,myisam和innodb的区别。
```
a. MyISAM类型不支持事务处理等高级处理，而InnoDB类型支持.
b. MyISAM类型的表强调的是性能，其执行数度比InnoDB类型更快.
c. InnoDB不支持FULLTEXT类型的索引.
d. InnoDB 中不保存表的具体行数，也就是说，
执行select count(*) from table时，InnoDB要扫描一遍整个表来计算有多少行，
但是MyISAM只要简单的读出保存好的行数即可.
e. 对于AUTO_INCREMENT类型的字段，InnoDB中必须包含只有该字段的索引，
但是在MyISAM表中，可以和其他字段一起建立联合索引。
f. DELETE FROM table时，
InnoDB不会重新建立表，而是一行一行的删除。
g. LOAD TABLE FROM MASTER操作对InnoDB是不起作用的，
解决方法是首先把InnoDB表改成MyISAM表，导入数据后再改成InnoDB表，
但是对于使用的额外的InnoDB特性(例如外键)的表不适用.
h. MyISAM支持表锁，InnoDB支持行锁。
```


###### 优化数据库的方法
[MySQL数据库优化的八种方式(经典必看)](https://www.jianshu.com/p/dac715a88b44)
```
  ● 选取最适用的字段属性，尽可能减少定义字段	宽度，尽量把字段设置NOTNULL，
    例如'省份'、'性别'最好适用ENUM
  ● 使用连接(JOIN)来代替子查询
  ● 适用联合(UNION)来代替手动创建的临时表
  ● 事务处理
  ● 锁定表、优化事务处理
  ● 适用外键，优化锁定表
  ● 建立索引
  ● 优化查询语句
```
##### 写出三种以上MySQL数据库存储引擎的名称（提示：不区分大小写）
```
MyISAM、InnoDB、
BDB（Berkeley DB）、
Merge、Memory（Heap）、Example、Federated、Archive、CSV、Blackhole、MaxDB 等等十几个引擎
```
###### 说出你所知道的三种以上开源数据库的名称（提示：想想目前国外流行的开源数据库）
```
MySQL、SQLite、BDB（Berkeley DB）、PostgreSQL、Firebird
```
###### MySQL数据库中的字段类型varchar和char的主要区别是什么？那种字段的查找效率要高，为什么?
```
Varchar是变长，节省存储空间，char是固定长度。查找效率要char型快，因为varchar是非定长，
必须先查找长度，然后进行数据的提取，比char定长类型多了一个步骤，所以效率低一些
```
##### ---Nginx知识相关
##### ---Linux知识相关
##### ---HTTP协议相关
###### HTTP中POST、GET、PUT、DELETE方式的区别
```
HTTP定义了与服务器交互的不同的方法
最基本的是POST、GET、PUT、DELETE，与其比不可少的URL的全称是资源描述符，
我们可以这样理解：url描述了一个网络上资源，
而post、get、put、delegate就是对这个资源进行增、删、改、查的操作！
```
###### HTTP协议中几个状态码的含义:503 500 401 403 404 200 301 302。。。
```
200 : 请求成功，请求的数据随之返回。
301 : 永久性重定向。
302 : 暂时行重定向。
401 : 当前请求需要用户验证。
403 : 服务器拒绝执行请求，即没有权限。
404 : 请求失败，请求的数据在服务器上未发现。
500 : 服务器错误。一般服务器端程序执行错误。
503 : 服务器临时维护或过载。这个状态时临时性的。
HTTP状态码分类:
  ● 1** - 信息，服务器收到的请求，需要请求者继续执行操作
  ● 2** - 成功，操作被成功接收并处理
  ● 3** - 重定向，需要进一步的操作以完成请求
  ● 4** - 客户端错误，请求包含语法错误或者无法完成请求
  ● 5** 服务器错误，服务器在处理请求的过程 中发生了错误
```

##### ---正则表达式相关
###### 邮箱正则
```
/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ 
```

###### 手机正则
```
^1(3|4|5|7|8)\d{9}$
```
###### 写出匹配邮箱地址和URL的两个正则表达式。
类似下面的：
邮箱地址：user_name.first@example.com.cn
URL地址：http://www.example.com.cn/user_profile.php?uid=1 
（提示：使用标准的正则表达式，就是PHP中preg_* 类的正则处理函数能够解析的正则）
```
邮箱：\/\/w+([-+.]/w+)*@/w+([-.]/w+)*/./w+([-.]/w+)*/
```
```
URL：/^http:////[/w]+/.[/w]+[/S]*/
```

##### ---redis和Memcache相关
##### ---模板smarty等相关
##### ---web网络安全知识
###### xss攻击
```
利用php htmlentities函数
例子
php防止XSS跨站脚本攻击的方法:是针对非法的HTML代码包括单双引号等，使用htmlspecialchars()函数 。
在使用htmlspecialchars()函数的时候注意第二个参数,
 直接用htmlspecialchars($string) 的话,第二个参数默认是ENT_COMPAT,函数默认只是转化双引号(“), 不对单引号(‘)做转义.
```
###### sql注入
```
（简单又有效的方法）PreparedStatement
 使用正则表达式过滤传入的参数
 字符串过滤
 jsp中调用该函数检查是否包函非法字符
```
##### ---数据算法结构知识
###### 写一个排序算法，可以是冒泡排序或者是快速排序，假设待排序对象是一个维数组。（提示：不能使用系统已有函数，另外请仔细回忆以前学习过的基础知识）
```
// 冒泡排序（数组排序）
function bubble_sort($array)
{
    $count = count($array);
    if ($count <=0 ) return false;
    for($i=0; $i<$count; $i++){
        for($j=$count-1; $j>$i; $j--){
            if ($array[$j] < $array[$j-1]){
                $tmp = $array[$j];
                $array[$j] = $array[$j-1];
                $array[$j-1] = $tmp;
            }
        }
    }
    return $array;
}
// 快速排序（数组排序）
function quicksort($array) {
    if (count($array) <= 1) return $array;
    $key = $array[];
    $left_arr = array();
    $right_arr = array();
    for ($i=1; $i<count($array); $i++){
        if ($array[$i] <= $key)
            $left_arr[] = $array[$i];
        else
            $right_arr[] = $array[$i];
    }
    $left_arr = quicksort($left_arr);
    $right_arr = quicksort($right_arr);
    return array_merge($left_arr， array($key)， $right_arr);
}
```
###### 写一个遍历指定目录下所有子目录和子文件的函数（提示：可以使用递归的方法）
```
function dir_all ( $path ) {
        $handler = opendir($path);
        while (false!==($tmp = readdir($handler))) { 
                if(is_dir( "$path/$tmp" )) {
                        if ($tmp=="." | $tmp=="..") continue;
                                echo $tmp."<br>/n";
                                dir_all ("$path/$tmp");
                } else {
                        echo $tmp ."<br>/n";
                }
        }
}
```
##### ---高并发大流量
###### 对于大流量网站，采用什么方法来解决访问量的问题
```
  ● 确认服务器硬件是否能够支持当前的流量
  ● 数据库读写分离，优化数据表
  ● 程序功能规则，禁止外部的盗链
  ● 控制大文件的下载
  ● 使用不同主机分流主要流量
```