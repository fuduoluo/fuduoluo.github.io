---
title: Fastadmin
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: d62e33af
date: 2019-06-22 22:31:45
updated: 2019-06-22 22:31:45
categories:
	fastadmin
tags:
	fastadmin
subtitle: 不断学习fastadmin 努力进步

---
<blockquote class="blockquote-center">fastadmin模块化开发</blockquote>

{% note success %}一键生成CRUD/一键生成菜单/一键生成API文档
强大的一键生成功能极速简化你的开发流程,加快你的项目开发 
{% endnote %}

<!--more-->
![四季](https://www.google.com/logos/doodles/2016/first-day-of-spring-2016-southern-hemisphere-5095436156141568.2-hp2x.gif)
```
define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'category/index',
                    add_url: 'category/add',
                    edit_url: 'category/edit',
                    del_url: 'category/del',
                    multi_url: 'category/multi',
                    dragsort_url: 'ajax/weigh',
                    table: 'category',
                }
            });

            var table = $("#table");
            var tableOptions = {
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                escape: false,
                pk: 'id',
                sortName: 'weigh',
                pagination: false,
                commonSearch: false,
                search: false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'type', title: __('Type'), searchList: Config.searchList, formatter: Table.api.formatter.normal},
                        {field: 'name', title: __('Name'), align: 'left'},
                        {field: 'nickname', title: __('Nickname')},
                        {field: 'flag', title: __('Flag'), operate: false, formatter: Table.api.formatter.flag},
                        {field: 'image', title: __('Image'), operate: false, formatter: Table.api.formatter.image},
                        {field: 'weigh', title: __('Weigh')},
                        {field: 'status', title: __('Status'), operate: false, formatter: Table.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            };
            // 初始化表格
            table.bootstrapTable(tableOptions);

            // 为表格绑定事件
            Table.api.bindevent(table);

            //绑定TAB事件
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                // var options = table.bootstrapTable(tableOptions);
                var typeStr = $(this).attr("href").replace('#', '');
                var options = table.bootstrapTable('getOptions');
                options.pageNumber = 1;
                options.queryParams = function (params) {
                    // params.filter = JSON.stringify({type: typeStr});
                    params.type = typeStr;

                    return params;
                };
                table.bootstrapTable('refresh', {});
                return false;

            });

            //必须默认触发shown.bs.tab事件
            // $('ul.nav-tabs li.active a[data-toggle="tab"]').trigger("shown.bs.tab");

        },
        add: function () {
            Controller.api.bindevent();
            $("#c-type").trigger("change");
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                $(document).on("change", "#c-type", function () {
                    $("#c-pid option[data-type='all']").prop("selected", true);
                    $("#c-pid option").removeClass("hide");
                    $("#c-pid option[data-type!='" + $(this).val() + "'][data-type!='all']").addClass("hide");
                    $("#c-pid").selectpicker("refresh");
                });
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
```

[站内调转](d8c6d5c6.html#more)
[站外调转](https://hexo.io/zh-cn/docs/internationalization)
基于完善的Auth权限控制管理、无限父子级权限分组、可自由分配子级权限、一个管理员可同时属于多个组别
基于Bootstrap和AdminLTE进行二次开发,手机、平板、PC均自动适配,无需要担心兼容性问题
不仅仅后台开发支持多语言,同时视图部分和JS部分仍然共享同一个语言包,语法相同且自动加载
控制器、模型、视图、JS一一对应,使用RequireJS进行JS模块化管理,采用Bower进行前端包组件管理
控制台进行一键生成控制器、模型、视图和JS文件,同时可一键生成后台权限节点和菜单栏
基于ThinkPHP行为功能实现的插件机制,拥有丰富的插件和扩展,可直接在线安装卸载