---
title: vue组件-插槽
permalink: "posts/:abbrlink/"
top_img: （除非特定需要，可以不寫）
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: "https://cdn.jsdelivr.net/npm/@bootcss/www.bootcss.com@0.0.3/dist/img/vuejs.png"
abbrlink: 4595edb9
date: 2020-02-21 10:52:59
updated: 2020-02-21 10:52:59
tags: Vue
categories: vue
keywords: vue slot v-slot
description: v-slot适用
---



![v-slot的取代](https://i.loli.net/2020/03/22/iHZ9AuycptWKTmz.png)

![废弃语法](https://i.loli.net/2020/03/22/czphIqNl4M9XQm2.png)

{% note success flat %}
介绍插槽使用及注意点
{% endnote %}

[基础插槽知识](https://cn.vuejs.org/v2/guide/components.html#%E9%80%9A%E8%BF%87%E6%8F%92%E6%A7%BD%E5%88%86%E5%8F%91%E5%86%85%E5%AE%B9)
[进阶插槽知识](https://cn.vuejs.org/v2/guide/components-slots.html)
[参考文章资料](https://segmentfault.com/a/1190000019630737?utm_source=tag-newest)

#### 插槽

{% note success flat %}
Vue 实现了一套内容分发的 API，将<slot>元素作为承载分发内容的出口，
插槽内可以包含任何模板代码，包含 HTML。插槽就是子组件提供的可替换模板，父组件可以根据需求改变模板的内容
脚手架[ES6 语法] 写法[移步参考文章资料](https://segmentfault.com/a/1190000019630737?utm_source=tag-newest)
{% endnote %}

#### 注意点

{% note warn flat %}

- v-slot 只能添加到 \<template>标签上，v-slot 的简写形式#，例如 v-slot:header 等价于 #header
- 利用了<slot>的 name 属性，利用这个属性可以用来定义额外的插槽，一个不带 name 的<slot>出口会带有隐含的名字“default”
- 跟 v-on 和 v-bind 一样，v-slot 也有缩写，即把参数之前的所有内容 (v-slot:) 替换为字符 #
{% endnote %}

#### 具名插槽

{% note success flat %}
    自身理解：顾名思义具体名称的插槽---需要多个插槽
    不带 name 的 <slot> 出口会带有隐含的名字“default”。
    <slot> 元素有一个特殊的 attribute：name,定义额外插槽
    向具名插槽提供内容的时候在一个 \<template> 元素上使用 v-slot 指令，
    并以 v-slot 的参数的形式提供其名称
{% endnote %}

```
<base-layout>
  <template v-slot:header>
    <h1>Here might be a page title</h1>
  </template>

  <p>A paragraph for the main content.</p>
  <p>And another one.</p>

  <template v-slot:footer>
    <p>Here's some contact info</p>
  </template>
</base-layout>

Vue.component('base-layout', {
    template: `
    <div class="container">
        <header>
            <slot name="header"></slot>
        </header>
        <main>
            <slot></slot>
        </main>
        <footer>
            <slot name="footer"></slot>
        </footer>
    </div>
    `
})

```

![具名插槽](https://i.loli.net/2020/03/22/OVL2rdaemXTBF8j.png)
#### 作用域插槽

{% note success flat %}
自身理解：顾名思义不同作用域插槽
通过“插槽prop”，父组件可以接收到子组件的数据，并且可以对数据进行操作，展现成父组件想要实现的样子。
插槽 prop：绑定在 <slot> 元素上的 attribute
{% endnote %}

```
//vue实例
const app = new Vue({
    el: '#app',
    data: function () {
        return {
            slotList: [{
                    title: '围城',
                    name: '钱钟书'
                },
                {
                    title: '追风筝的人',
                    name: '卡勒德·胡赛尼'
                },
                {
                    title: '灿烂千阳',
                    name: '卡勒德·胡赛尼'
                }
            ]
        }
    }

});
//子组件
Vue.component('slot-child', {
    // props:["slotList"] 只适用只有开发原型系统时可以接受
    props: {
        slotList: {
            type: Array,
            default: () => []
        }
    },
    data:function(){
        return {}
    },
    template: `
    <div>
        <ul>
            <slot name="slot-scope" v-for="item in slotList" v-bind="item">
                <li>书名：《{{item.title}}》; 作者：{{item.name}}</li>
            </slot>
        </ul>
    </div>
    `
})
//html部分
<slot-child :slot-list='slotList'>
    <template v-slot:slot-scope="item">
        <!-- 这里的`v-slot`指向的是name='slot-scope'的`<slot>`,通过item可以接收到子组件的返回值，这个值是自定义的，被称为插槽prop -->
        <li>书名：<span style="color: red">《{{item.title}}》</span> 作者：<span
                style='color: green'>{{item.name}}</span></li>
        <!-- 接收到子组件的返回值item，这里父组件重新对数据进行排版以满足自己的需求，从而提高组件的复用程度 -->
    </template>
</slot-child>
```
```
//官网案例
    <current-user>
        <!-- <template #userdata="slotProps"> 插槽缩写-->
        <template v-slot:userdata="slotProps">
            {{slotProps.user.firstName}}
        </template>
    </current-user>

    Vue.component('current-user', {
        data: function () {
            return {
                user: {
                    'firstName': "tom",
                    'lastName': "jack",
                },
            }
        },
        template: `
            <span>
                <slot name="userdata" v-bind:user="user">
                    <!-- 后备内容即默认值 -->
                    {{user.lastName }}
                </slot>
            </span>
        `
    })
```

![作用域插槽](https://i.loli.net/2020/03/22/sQv5PrgnGlJEq6c.png)

##### 独占默认插槽的缩写语法

{% note warn flat %}
默认插槽的缩写语法不能和具名插槽混用，因为它会导致作用域不明确
{% endnote %}

```
//原本写法
<current-user v-slot:default="slotProps">
  {{ slotProps.user.firstName }}
</current-user>

//缩写
<current-user v-slot="slotProps">
  {{ slotProps.user.firstName }}
</current-user>

```