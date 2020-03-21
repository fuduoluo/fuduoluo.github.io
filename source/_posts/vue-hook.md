---
title: Vue的钩子函数
permalink: 'posts/:abbrlink.html'
top_img: （除非特定需要，可以不寫）
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: 'https://cdn.jsdelivr.net/npm/@bootcss/www.bootcss.com@0.0.3/dist/img/vuejs.png'
tags: vue
categories: vue
keywords: vue hook
description: >-
  说到Vue的钩子函数，可能很多人只停留在一些很简单常用的钩子(created,mounted)，而且对于里面的区别，什么时候该用什么钩子，并没有仔细的去研究过，且Vue的生命周期在面试中也算是比较高频的考点，那么该如何回答这类问题，让人有眼前一亮的感觉呢..
abbrlink: 8192d00f
date: 2020-02-24 09:44:03
updated: 2020-02-24 09:44:03
---


<blockquote class="blockquote-center">vue-router 提供的导航守卫主要用来通过跳转或取消的方式守卫导航, “导航”表示路由正在发生改变。</blockquote>

[参考文章-详细介绍入口](https://segmentfault.com/a/1190000015727279)

{% note danger %}
通俗理解：路由跳转是一个大的过程，这个大的过程分为跳转前中后等等细小的过程，在每一个过程中都有一函数，这个函数能让你操作一些其他的事儿的时机，这就是导航守卫
记住 参数或查询的改变并不会触发进入/离开的导航守卫. 你可以通过观察 $route 对象来应对这些变化，或使用 beforeRouteUpdate 的组件内守卫
{% endnote %}

#### 导航守护

- 全局的, 单个路由独享的, 或者组件级的

#### 全局守卫[触发路由就会触发]

##### vue-router 全局有三个守卫：

- router.beforeEach 全局前置守卫 进入路由之前
- router.beforeResolve 全局解析守卫(2.5.0+) 在 beforeRouteEnter 调用之后调用
- router.afterEach 全局后置钩子 进入路由之后

##### 使用方法

{% note warning %}
确保要调用 next 方法，否则钩子就不会被 resolved。
守卫是异步解析执行，此时导航在所有守卫 resolve 完之前一直处于 等待中
{% endnote %}

```
    // main.js 入口文件
    import router from './router'; // 引入路由
    router.beforeEach((to, from, next) => {
      next();
    });
    router.beforeResolve((to, from, next) => {
      next();
    });
    router.afterEach((to, from) => {
      console.log('afterEach 全局后置钩子');
    });
```

##### to from next 三个参数

{% note warning %}
next()必须调用，否则不能进入路由(页面空白)
{% endnote %}

- to: Route: 即将要进入的目标 路由对象----跳转目标 url 地址

- from: Route: 当前导航正要离开的路由----准备开始跳转 url 地址

- next: Function: 一定要调用该方法来 resolve 这个钩子。执行效果依赖 next 方法的调用参数。
  - next() 进入该路由
  - next(false): 取消进入路由,回到准备开始跳转的 url 地址
  - next 跳转新路由 next('path 地址')或者 next({path:''})或者 next({name:''}) 亦可配置 replace: true、name: 'home' 选项

#### 路由独享守卫【某些路由单独配置守卫】

```
   const router = new VueRouter({
      routes: [
        {
          path: '/foo',
          component: Foo,
          beforeEnter: (to, from, next) => {
            // 参数用法什么的都一样,调用顺序在全局前置守卫后面，所以不会被全局守卫覆盖
            // ...
          }
        }
      ]
    })
```

#### 组件内的守卫

{% note warning %}
1.beforeRouteEnter 守卫 不能 访问 this，因为守卫在导航确认前被调用,因此即将登场的新组件还没被创建
2.通过传一个回调给 next来访问组件实例
{% endnote %}


##### 文档内容

- beforeRouteEnter
- beforeRouteUpdate (2.2 新增)
- beforeRouteLeave

```
const Foo = {
  template: `...`,
  beforeRouteEnter (to, from, next) {
    // 在渲染该组件的对应路由被 confirm 前调用
    // 不！能！获取组件实例 `this`
    // 因为当守卫执行前，组件实例还没被创建
  },
  beforeRouteUpdate (to, from, next) {
    // 在当前路由改变，但是该组件被复用时调用
    // 举例来说，对于一个带有动态参数的路径 /foo/:id，在 /foo/1 和 /foo/2 之间跳转的时候，
    // 由于会渲染同样的 Foo 组件，因此组件实例会被复用。而这个钩子就会在这个情况下被调用。
    // 可以访问组件实例 `this`
  },
  beforeRouteLeave (to, from, next) {
    // 导航离开该组件的对应路由时调用
    // 可以访问组件实例 `this`
  }
}

//在导航被确认的时候执行回调，并且把组件实例作为回调方法的参数。
beforeRouteEnter (to, from, next) {
  next(vm => {
    // 通过 `vm` 访问组件实例
    //执行回调的时机在mounted后面
  })
}
```

![完整的路由导航解析流程-不包括其他生命周期](https://upload-images.jianshu.io/upload_images/3098875-6033cf8094dc20cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 路由元信息[header中的mete等标签设置]
```
const router = new VueRouter({
  routes: [
    {
      path: '/foo',
      component: Foo,
      children: [
        {
          path: 'bar',
          component: Bar,
          // a meta field
          meta: { requiresAuth: true }
        }
      ]
    }
  ]
})
//访问mate字段
遍历 $route.matched 来检查路由记录中的 meta 字段
```
#### [keep-alive](https://segmentfault.com/a/1190000015727279#item-3)

{% note warning %}
内置组件keep-alive来缓存组件内部状态，避免重新渲染
它自身不会渲染一个 DOM 元素，也不会出现在父组件链中。
在被keep-alive包含的组件/路由中，会多出两个生命周期的钩子:activated 与 deactivated。
{% endnote %}

- activated:在组件第一次渲染时会被调用，之后在每次缓存组件被激活时调用。
- deactivated：组件被停用(离开路由)时调用

{% note warning %}
使用keep-alive可以将所有路径匹配到的路由组件都缓存起来，包括路由组件里面的组件，keep-alive大多数使用场景就是这种。
{% endnote %}

```
    <keep-alive>
        <router-view></router-view>
    </keeo-alive>
```
##### 缓存想要的路由

[缓存想要的路由](https://segmentfault.com/a/1190000015727279#item-3-8)

#### 组件生命周期钩子

![生命周期示意图](https://cn.vuejs.org/images/lifecycle.png)
![生命周期注意点](https://upload-images.jianshu.io/upload_images/3098875-4a0dfe761713f69b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![完整钩子函数触发顺序](https://upload-images.jianshu.io/upload_images/3098875-2d6230fe6061a16a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


