---
title: Layui 使用
tags: LayUi
top_img: 'https://ae01.alicdn.com/kf/U255e91ad9f9d4ebda2005c499b7b9016y.jpg'
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: 'https://ae01.alicdn.com/kf/U255e91ad9f9d4ebda2005c499b7b9016y.jpg'
categories: LayUi Js
keywords: layui 经典模块化前端框架
description: 由职业前端倾情打造，面向全层次的前后端开发者，低门槛开箱即用的前端 UI 解决方案
abbrlink: 2e89b63e
date: 2021-01-07 16:23:38
updated: 2021-01-07 16:23:38
top:
mathjax:
katex:
aside:
aplayer:
highlight_shrink:
---

{% note info flat %}
layui 前端框架基础使用记录
[文档基本使用地址](https://www.layui.com/doc/modules/table.html)
{% endnote %}

{% note success  flat %}
下载-引入js和css
{% endnote %}

```
<script src="./layui.all.js"></script>
<link rel="stylesheet" href="./layui.css">
```
{% note success flat %}
Html部分
{% endnote %}

```
    <table class="layui-hide" id="Commission_log"></table>
    <script type="text/html" id="commissiondbar">
        <button id="exports" class="layui-btn layui-btn-success layui-btn-sm data-add-btn">
            <i class="layui-icon layui-icon-export">全部导出Excel表格</i>
        </button>
        <input type="hidden" name="" id="user_id" value="">
    </script>
```

{% note success flat %}
Js部分-简单表格基本使用
{% endnote %}

```
<script>
        layui.use(['layer', 'form', 'table', 'laydate', 'jquery'], function () {
            var $ = layui.$,
            layer = layui.layer,
            form = layui.form,
            laydate = layui.laydate,
            table = layui.table;

            staffdetailList = table.render({
                elem: '#Commission_log'// 数据挂在dom对象
                , totalrow: true
                , title: "xxxxx汇总"
                , toolbar: '#commissiondbar' //开启头部工具栏，并为其绑定左侧模板
                , defaultToolbar: ['filter', 'exports']
                , url: "{:url('CreditsLog/commissionInfo')}"
                , where: {
                    order_num : "",
                }
                , cols: [[ //标题栏
                    { field: 'id', title: 'ID' }
                    , { field: 'userName', title: '用户名称' }
                    , { field: 'agencyName', title: '代理商角色名称' }
                    , { field: 'credits', title: '提成变化' }
                    , { field: 'order_num', title: '订单号', width: '20%' }
                    , { field: 'type', title: '提成来源' }
                    , { field: 'from_type', title: '订单分类' }
                    , { field: 'memo', title: '来源描述' }
                    , { field: 'create_time', title: '创建时间',width: '15%', sort: true }
                ]]
                , data: []
                , height: 550 //容器高度
                , even: true
                , page: true //是否显示分页
                , limits: [10, 20, 30, 40, 50, 60]
                , limit: 10//每页默认显示的数量
            });
    });
```

{% note success flat %}
Js部分-导航栏搜索功能
{% endnote %}

```
    //触发事件
    $('.demoTable .layui-btn').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    active = {
        search: function () {
        var value = $('#value').val(),
        //执行重载
        table.reload('Commission_log', {
            url: "请求地址",
            page: {
                curr: 1 //重新从第 1 页开始
            }
            , where: {
                paramName: value ? value : "",
            }
        }, 'data');
    }};
```
{% note success flat %}
Js部分-拓展功能-全部导出
{% endnote %}

```
    // 全部导出xxxx明细
    <!-- 注意需要使用 $(document) 触发点击事件 -->
    $(document).on('click', '#exports', function () {
        var user_id = $('#user_id').val();
        $.ajax({
            url: "请求查询符合条件全部数据地址",
            type: 'get',
            data: {
                mycode: 1,
                name: value ? value : "",
            },
            async: false,
            dataType: 'json',
            success: function (res) {
                table.exportFile(staffdetailList.config.id, res.data, 'xls');
            }
        });
    })
```
{% note flat %}
默認 提示塊標籤
{% endnote %}

{% note default flat %}
default 提示塊標籤
{% endnote %}

{% note primary flat %}
primary 提示塊標籤
{% endnote %}

{% note success flat %}
success 提示塊標籤
{% endnote %}

{% note info flat %}
全部导出功能
{% endnote %}

{% note warning flat %}
warning 提示塊標籤
{% endnote %}

{% note danger flat %}
danger 提示塊標籤
{% endnote %}


{% note 'fab fa-cc-visa' modern %}
你是刷 Visa 還是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' modern %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' modern %}
小心開車 安全至上
{% endnote %}
{% note red 'fas fa-fan' modern%}
這是三片呢？還是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' modern %}
你是刷 Visa 還是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' modern %}
剪刀石頭布
{% endnote %}
{% note green 'fab fa-internet-explorer' modern %}
前端最討厭的瀏覽器
{% endnote %}

