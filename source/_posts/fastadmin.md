---
title: fastadmin-Boostrap-table 学习小记
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: d62e33af
date: 2019-06-22 22:31:45
updated: 2019-06-22 22:31:45
categories:
	fastadmin Boostrap-table
tags:
	fastadmin Boostrap-table
subtitle: 不断学习fastadmin 努力进步

---
<blockquote class="blockquote-center">fastadmin-Boostrap-table</blockquote>

{% note success %}一键生成CRUD/一键生成菜单/一键生成API文档
强大的一键生成功能极速简化你的开发流程,加快你的项目开发 
{% endnote %}

<!--more-->
##### 前言
[boostrap-table官网文档](https://examples.bootstrap-table.com/#options/search-text.html)

##### 图解
[一张图解析FastAdmin中的表格列表的功能](https://ask.fastadmin.net/article/323.html)

#### 以下为使用遇到问题小记

##### status字段
![效果](https://upload-images.jianshu.io/upload_images/3098875-16fda5bcfc1d3503.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 1.1数据库
![效果](https://upload-images.jianshu.io/upload_images/3098875-b8a39aa7ae9a17d9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3098875-5886e5950cbd2403.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 1.2JS
```
 {field: 'status', title: __('Status'),formatter: Table.api.formatter.status,searchList: {normal: __('Normal'), hidden: __('Hidden')}},
或者
{field: 'status', title: __('Status'),formatter: Table.api.formatter.status},
```
###### 1.3PHP
```
<?php

namespace app\admin\model;
use think\Model;
class Indexpic extends Model
{
    // 表名
    protected $name = '表名';
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;
    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    // 追加属性
    protected $append = [
        'status_text'
    ];
    public function getStatusList() {
        return ['normal' => __('Normal'), 'hidden' => __('Hidden')];
    }
    public function getStatusTextAttr($value, $data){
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }
}

```
##### 隐藏默认按钮
![image.png](https://upload-images.jianshu.io/upload_images/3098875-63d38e16f75aee51.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###### 1.1找到对应的JS设置为空
![image.png](https://upload-images.jianshu.io/upload_images/3098875-c5df8984a92391e5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###### 1.2效果
![image.png](https://upload-images.jianshu.io/upload_images/3098875-60d4697bd4c09a31.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 1.3原因：
###### 作者通过获取按钮名称来增加按钮
![image.png](https://upload-images.jianshu.io/upload_images/3098875-1013288cd447b845.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 按钮组
```
<script>
  buttons: [{
    name: 'detail',//按钮唯一标识,其中add/edit/del/dragsort已经被占用,请勿使用。
    text: '同步',//按钮的文本内容,如果不需要显示文本可忽略
    title: '同步',//鼠标移上去的标题或弹窗/选项显示的标题
    icon: 'fa fa-list',//按钮的图标,请使用font-awesome图标库
     extend:'data-toggle="tooltip"',//按钮扩展信息--比如我们想在新窗口中打开链接，则配置extend:'   target="_blank"'即可
     classname: 'btn btn-xs btn-success btn-ajax disabletongbu',
     url: 'order/edit',//按钮的链接/Ajax事件请求的URL/弹窗链接/选项卡链接
    //是否隐藏按钮,按钮默认显示,支持function和bool类型
     hidden:function (row,value,index) {
     //根据某个条件进行隐藏此按钮
      console.log(row);//返回数据
      console.log(index);//下标
      console.log(value);//该button配置信息
    },
     success:function(data, ret){
    //成功后的返回
    able.bootstrapTable('refresh');
     },error:function(){
    //失败后的返回
   },
    callback: function (data) {
      //弹窗回传的回调,只针对btn-dialog事件,需要在对应打开的页面中使用Fast.api.close(data);进行回传数据
       Layer.alert("接收到回传数据：" + JSON.stringify(data), {title: "回传数据"});
     },
     refresh:function () {
      // 自动刷新,只针对btn-ajax事件--未实践
     },
     confirm:function () {
               //确认框提示文字,配置后会在确认操作再执行对应的事件，只针对btn-ajax/btn-dialog/btn-addtabs事件                    
       }
   }]
</script>
```
#####  X-edittable使用
```
根据条件去判断是否可以编辑
                        {
                            field: 'remark',
                            title: __('Remark'),
                            operate:false,
                            editable: {
                                type: 'text',
                               emptytext: "输入备注",
                              noeditFormatter: function (value,row,index) {
                                    if(row.show == 1){
                                        return false;
                                    }else {
                                        return '';
                                    }
                                }
                            }
                         },

```




