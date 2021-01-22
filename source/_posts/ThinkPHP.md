---
title: ThinkPHP5.1手记

top_img: https://box.kancloud.cn/2015-12-12_566b6a10506a4.png
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://i.loli.net/2020/03/20/cHFBvGO56rp3WSX.png
categories: ThinkPHP5
keywords: ThinkPHP5
description: ThinkPHP5日常手记
abbrlink: 3ec68ba4
date: 2019-12-27 20:29:21
updated: 2020-03-28 11:52:36
tags: ThinkPHP5
---

<blockquote class="blockquote-center"></blockquote>
{% note success flat %}
ThinkPHP V5.0——为API开发而设计的高性能框架
{% endnote %}

#### Token令牌[管理api接口的好助手]
##### Token令牌是客户身份识别码
##### 通用思路Token令牌大致流程
![image.png](https://i.loli.net/2020/03/22/xOkMwqHtgAFR5pd.png)

##### 用户获取令牌，完成客户注册过程
-  用户携带账号密码请求服务端getToken方法生成令牌 

![image.png](https://i.loli.net/2020/03/22/F4iVcjyK3GTCAI6.png)
- 用户请求接口时携带Token，去请求例如下单接口，在根据令牌去确认用户是否有权限去请求该接口
- 是否有权限请求接口：1.数据有该用户Token值 2.Token设置有效时间 3.根据Token值对应的权限分组

#### list函数用法
```
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
#### 标签位
```
1.可以设置行为的位置
2.可以理解为标签位[适合放置地雷的地方]绑定行为[放一颗地雷, 留一根线链着标签]
```
##### 扩展理解
- 钩子(中间件)：应用前后,模型,控制器初始化前后等想做的一些事情提供了便利的行为
[标签位栗子](https://blog.csdn.net/lovemyself196221/article/details/78183699)
[行为(钩子)具体使用查看TP5官网](https://www.kancloud.cn/manual/thinkphp5/118130)
[fastadmin新增标签位](http://doc.fastadmin.net/docs/addons.html#%E7%9B%AE%E5%BD%95%E4%BB%8B%E7%BB%8D-2)

##### sprintf函数 
```
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
#### 有趣的PHP赋值运算，位运算符
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
#### PHP版本出现错误
![弃用-方法名和类名一样的构造函数](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/fastadmin/3098875-b4bd5a143605e8f6.png)

![文档说明](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/fastadmin/3098875-4c52a07f6ec7e856.png)

#### 用 http_build_query 对 url 进行编码：
- http_build_query 可以将一维或多维 数组/对象 进行 url_encode 编码，并返回编码后的字符串。
- 无论传入的数据是数组还是 object，解码后都将转换为数组。
[具体了解，戳这里！](https://www.jianshu.com/p/5e9239e44eb8)

#### 记微信支付回调方法扣除库存和更新状态失败
- 没有证书所导致【未验证】
#### 关于使用[param](https://www.kancloud.cn/manual/thinkphp5_1/353987)（） 获取 参数 会多出 一个 /控制器/方法名 这样的一个参数出来？

```php
'/admin/index/login_html' => string '' (length=0) 出现这个出来
'username' => string '1' (length=1)
'password' => string '1' (length=1)
```

解决：

> 首先确定下使用TP5.1框架具体版本号：{$Think.VERSION} ；
>
> 目前使用版本号５.1.32 LTS

> 几经周转在[文档](https://www.kancloud.cn/manual/thinkphp5_1/353987)输入变量中看到如下内容

![image.png](https://i.loli.net/2020/03/26/vWBKh9kdqfrTDiR.png)

>  查看更新日志

![image.png](https://i.loli.net/2020/03/26/DiIjmznpfb1GJku.png)

> 对比代码

![image.png](https://i.loli.net/2020/03/26/6lXTnaHiA3vtxK4.png)

> [更新代码地址](https://gitee.com/liu21st/framework/blob/5.1/library/think/Request.php#)：Requset类更换
>
> 经尝试更新Request类还是无效！！！

> 最终解决方法如下：

```php
修改伪静态：  RewriteRule ^(.*)$ index.php [L,E=PATH_INFO:$1]
```
#### TP项目redis设置定时任务写成bat文件加入window任务计划

```
bat
//前提条件已安装本地redis服务【window执行任务计划比较少，多为linux上执行xshell脚步】

//bat文件示例：
@echo off
cd D:/phpstudy_pro/WWW/efa/public/  //项目路径
php index.php[入口文件] index/redis_go_up/index[参数：模块/控制器/方法]
::pause//是否暂停显示弹窗执行状态

//之后在 任务计划程序 中创建一个基础任务计划
//创建完成选择你所写好的脚步bat文件夹确认即可
```

![image.png](https://i.loli.net/2020/03/19/tLPRHFWQuO1DGon.png)


#### TP5.1 单独配置分页和全局配置
{% note info flat %}
其他相关介绍请查看文档进行了解
{% endnote %}

{% note warning flat %}
单独配置模块分页--比如后台
{% endnote %}

{% note green 'fab fa-internet-explorer' modern%}
在后台控制器/admin下新建一个文件夹config/paginate.php
内容如下：
{% endnote %}

```
<?php
return [
    //分页配置
    'type'      => 'page\Page',
    'var_page'  => 'page',
    'list_rows' => 10,
];

```

{% note green 'fab fa-internet-explorer' modern%}
在/extend目录下新建一个自定义文件 page/Pgae.php
内容如下：
{% endnote %}
```
<?php
 namespace page;
 
 use think\Paginator;
 
 class Page extends Paginator
 {
 
     //首页
     protected function home() {
         if ($this->currentPage() > 1) {
             return "<a href='" . $this->url(1) . "' title='首页'>首页</a>";
         } else {
             return "<p>首页</p>";
         }
     }
 
     //上一页
     protected function prev() {
         if ($this->currentPage() > 1) {
             return "<a href='" . $this->url($this->currentPage - 1) . "' title='上一页'>上一页</a>";
         } else {
             return "<p>上一页</p>";
         }
     }
 
     //下一页
     protected function next() {
         if ($this->hasMore) {
             return "<a href='" . $this->url($this->currentPage + 1) . "' title='下一页'>下一页</a>";
         } else {
             return"<p>下一页</p>";
         }
     }
 
     //尾页
     protected function last() {
         if ($this->hasMore) {
             return "<a href='" . $this->url($this->lastPage) . "' title='尾页'>尾页</a>";
         } else {
             return "<p>尾页</p>";
         }
     }
 
     //统计信息
     protected function info(){
         return "<p class='pageRemark'>共<b>" . $this->lastPage .
             "</b>页<b>" . $this->total . "</b>条数据</p>";
     }
 
     /**
      * 页码按钮
      * @return string
      */
     protected function getLinks()
     {
 
         $block = [
             'first'  => null,
             'slider' => null,
             'last'   => null
         ];
 
         $side   = 3;
         $window = $side * 2;
 
         if ($this->lastPage < $window + 6) {
             $block['first'] = $this->getUrlRange(1, $this->lastPage);
         } elseif ($this->currentPage <= $window) {
             $block['first'] = $this->getUrlRange(1, $window + 2);
             $block['last']  = $this->getUrlRange($this->lastPage - 1, $this->lastPage);
         } elseif ($this->currentPage > ($this->lastPage - $window)) {
             $block['first'] = $this->getUrlRange(1, 2);
             $block['last']  = $this->getUrlRange($this->lastPage - ($window + 2), $this->lastPage);
         } else {
             $block['first']  = $this->getUrlRange(1, 2);
             $block['slider'] = $this->getUrlRange($this->currentPage - $side, $this->currentPage + $side);
             $block['last']   = $this->getUrlRange($this->lastPage - 1, $this->lastPage);
         }

         $html = '';
 
         if (is_array($block['first'])) {
             $html .= $this->getUrlLinks($block['first']);
         }
 
         if (is_array($block['slider'])) {
             $html .= $this->getDots();
             $html .= $this->getUrlLinks($block['slider']);
         }
 
         if (is_array($block['last'])) {
             $html .= $this->getDots();
             $html .= $this->getUrlLinks($block['last']);
         }
 
         return $html;
     }
 
     /**
      * 渲染分页html
      * @return mixed
      */
     public function render()
     {
         if ($this->hasPages()) {
             if ($this->simple) {
                 return sprintf(
                     '%s<div class="pagination">%s %s %s</div>',
                     $this->css(),
                     $this->prev(),
                     $this->getLinks(),
                     $this->next()
                 );
             } else {
                 return sprintf(
                     '%s<div class="pagination">%s %s %s %s %s %s</div>',
                     $this->css(),
                     $this->home(),
                     $this->prev(),
                     $this->getLinks(),
                     $this->next(),
                     $this->last(),
                     $this->info()
                 );
             }
         }
     }
 
     /**
      * 生成一个可点击的按钮
      *
      * @param  string $url
      * @param  int    $page
      * @return string
      */
     protected function getAvailablePageWrapper($url, $page)
     {
         return '<a href="' . htmlentities($url) . '" title="第"'. $page .'"页" >' . $page . '</a>';
     }
 
     /**
      * 生成一个禁用的按钮
      *
      * @param  string $text
      * @return string
      */
     protected function getDisabledTextWrapper($text)
     {
         return '<p class="pageEllipsis">' . $text . '</p>';
     }
 
     /**
      * 生成一个激活的按钮
      *
      * @param  string $text
      * @return string
      */
     protected function getActivePageWrapper($text)
     {
         return '<a href="" class="cur">' . $text . '</a>';
     }
 
     /**
      * 生成省略号按钮
      *
      * @return string
      */
     protected function getDots()
     {
         return $this->getDisabledTextWrapper('...');
     }
 
     /**
      * 批量生成页码按钮.
      *
      * @param  array $urls
      * @return string
      */
     protected function getUrlLinks(array $urls)
     {
         $html = '';
 
         foreach ($urls as $page => $url) {
             $html .= $this->getPageLinkWrapper($url, $page);
         }
 
         return $html;
     }
 
     /**
      * 生成普通页码按钮
      *
      * @param  string $url
      * @param  int    $page
      * @return string
      */
     protected function getPageLinkWrapper($url, $page)
     {
         if ($page == $this->currentPage()) {
             return $this->getActivePageWrapper($page);
         }
 
         return $this->getAvailablePageWrapper($url, $page);
     }
 
     /**
      * 分页样式
      */
     protected function css(){
         return '  <style type="text/css">
             .pagination p{
                 margin:0;
                 cursor:pointer
             }
             .pagination{
                 height:40px;
                 padding:20px 0px;
             }
             .pagination a{
                 display:block;
                 float:left;
                 margin-right:10px;
                 padding:2px 12px;
                 height:24px;
                 border:1px #cccccc solid;
                 background:#fff;
                 text-decoration:none;
                 color:#808080;
                 font-size:12px;
                 line-height:20px;
             }
             .pagination a:hover{
                 color:#009688;
                 background: white;
                 border:1px #009688 solid;
             }
             .pagination a.cur{
                 border:none;
                 background:#009688;
                 color:#fff;
             }
             .pagination p{
                 float:left;
                 padding:2px 12px;
                 font-size:12px;
                 height:24px;
                 line-height:20px;
                 color:#bbb;
                 border:1px #ccc solid;
                 background:#fcfcfc;
                 margin-right:8px;
 
             }
             .pagination p.pageRemark{
                 border-style:none;
                 background:none;
                 margin-right:0px;
                 padding:4px 0px;
                 color:#666;
             }
             .pagination p.pageRemark b{
                 color:#333;
             }
             .pagination p.pageEllipsis{
                 border-style:none;
                 background:none;
                 padding:4px 0px;
                 color:#808080;
             }
             .dates li {font-size: 14px;margin:20px 0}
             .dates li span{float:right}
         </style>';
     }
 }
```
{% note warning flat %}
全局配置模块分页--比如后台
{% endnote %}

{% note success flat %}
进行修改thinkphp目录下的convention.php文件
{% endnote %}

```
//分页配置
'paginate'   => [
        // 'type'      => 'page\Page',
        'type'      => 'bootstrap',
        'var_page'  => 'page',
        'list_rows' => 15,
],
```
[参考链接-城市之雾](https://my.oschina.net/u/3477605/blog/3125747)
[参考链接-风影OvO](https://www.fyovo.com/6259.html)