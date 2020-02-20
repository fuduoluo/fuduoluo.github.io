---
title: Vue组件-如何绑定原生事件至组件
permalink: "posts/:abbrlink.html"
top_img: （除非特定需要，可以不寫）
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://cdn.jsdelivr.net/npm/@bootcss/www.bootcss.com@0.0.3/dist/img/vuejs.png
abbrlink: "48944071"
date: 2020-02-20 16:09:08
updated: 2020-02-20 16:09:08
tags: Vue
categories: Vue
keywords:
description: 解决组件通信方案
---

<meta name="referrer" content="never">
<blockquote class="blockquote-center">Vue组件学习</blockquote>

#### 父组件与孙组件怎么通信？

##### [参考文章：vue组件间通信六种方式差异](https://www.jianshu.com/p/c015141441f4)

- $attrs/$listeners 具体使用例子
  {% note success %}
  \$attrs--继承所有的父组件属性（除了 prop 传递的属性、class 和 style ）

  inheritAttrs：默认值 true,继承所有的父组件属性（除 props 的特定绑定）作为普通的 HTML 特性应用在子组件的根元素上，如果你不希望组件的根元素继承特性设置 inheritAttrs: false,但是 class 属性会继承

  $listeners--属性，它是一个对象，里面包含了作用在这个组件上的所有监听器，你就可以配合 v-on="$listeners" 将所有的事件监听器指向这个组件的某个特定的子元素
  {% endnote %}

    ```
    <div id="app-7">
            <base-input label="for-input" placeholder="$attr" 
            class="username-input"  v-on:listener-name="methodName" v-model="test"></base-input>
            {{test}}
    </div>
    
    Vue.component('base-input', {
        inheritAttrs: false,//控制继承父组件属性
        props: ['label', 'value'],
        computed: {
            inputListeners: function () {
            var vm = this
            // `Object.assign` 将所有的对象合并为一个新对象
            return Object.assign({},
                // 我们从父级添加所有的监听器
                this.$listeners,
                // 然后我们添加自定义监听器，
                // 或覆写一些监听器的行为
                {
                // 这里确保组件配合 `v-model` 的工作
                input: function (event) {
                    vm.$emit('input', event.target.value)
                }
                }
            )
            }
        },
        template: `
            <label>
            {{ label }}
            <input
                v-bind="$attrs"
                v-bind:value="value"
                v-on="inputListeners"
            >
            </label>
        `,
        mounted: function() {
                console.log(this.$attrs);//打印继承属性
                console.log(this.$listeners);//打印使用组件的事件
            }
        })
            var app7 = new Vue({
                el: '#app-7',
                data: {
                    test:''
                },
                methods: {
                    methodName:function(e){
                        console.log(2);
                    }
                }
            })
    ```
    {% note primary %}
    [$listeners详解](https://cn.vuejs.org/v2/api/#vm-listeners)
    使用base-input时，传入的所有v-on事件都可以在$listeners对象中找到
    【包含了父作用域中的 (不含 .native 修饰器的) v-on 事件监听器】
    computed -> inputListeners就是把用户使用base-input组件时传入的v-on方法收集起来 在转发给input框
    实质：只是转发了父组件传入的参数给input元素
    {% endnote %}
#### 监听一个组件原生根元素上事件 native 修饰符
    {% note warning %}
    普通元素无效
    {% endnote %}
    - 使用 v-on 的 .native 修饰符：
    ```
    <div id="app">
    　　<my-component v-on:click.native="clickFun"></my-component>
    </div>
    Vue.component('my-component', {
    　　template: `<a href='#'>click me</a>`
    })
    new Vue({
    　　el: '#app',
    　　methods: {
    　　　　clickFun: function(){
    　　　　　　console.log("message: success")
    　　　　}
    　　}
    })
```