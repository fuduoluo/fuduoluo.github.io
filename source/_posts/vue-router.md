---
title: Vue Router之基础
permalink: 'posts/:abbrlink.html'
top_img: （除非特定需要，可以不寫）
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: "https://cdn.jsdelivr.net/npm/@bootcss/www.bootcss.com@0.0.3/dist/img/vuejs.png"
tags: vue
categories: vue
keywords: Vue Router
description: Vue Router 是 Vue.js 官方的路由管理器。它和 Vue.js 的核心深度集成，让构建单页面应用变得易如反掌
abbrlink: 49bed910
date: 2020-02-23 17:41:25
updated: 2020-02-23 17:41:25
---
<meta name="referrer" content="never">
<blockquote class="blockquote-center"></blockquote>
{% note success %}
Vue Router 是 Vue.js 官方的路由管理器。它和 Vue.js 的核心深度集成，让构建单页面应用变得易如反掌
{% endnote %}

#### Router使用

{% note warning %}
任何组件内通过 this.$router 访问路由器
当匹配到一个路由时，参数值会被设置到 this.$route.params
{% endnote %}

```
//html
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>

<div id="app">
  <h1>Hello App!</h1>
  <p>
    <!-- 使用 router-link 组件来导航. -->
    <!-- 通过传入 `to` 属性指定链接. -->
    <!-- <router-link> 默认会被渲染成一个 `<a>` 标签 -->
    <router-link to="/foo">Go to Foo</router-link>
  </p>
  <!-- 路由出口 -->
  <!-- 路由匹配到的组件将渲染在这里 -->
  <router-view></router-view>
</div>
```
```
//Js
// 0. 如果使用模块化机制编程，导入Vue和VueRouter，要调用 Vue.use(VueRouter)

// 1. 定义 (路由) 组件。
// 可以从其他文件 import 进来
const Foo = { template: '<div>foo</div>' }

// 2. 定义路由
// 每个路由应该映射一个组件。 其中"component" 可以是
// 通过 Vue.extend() 创建的组件构造器，
// 或者，只是一个组件配置对象。
const routes = [
  { path: '/foo', component: Foo }
]

// 3. 创建 router 实例，然后传 `routes` 配置
const router = new VueRouter({
  routes // (缩写) 相当于 routes: routes
})

// 4. 创建和挂载根实例。
// 记得要通过 router 配置参数注入路由，
// 从而让整个应用都有路由功能
const app = new Vue({
  router
}).$mount('#app')
```
#### 动态匹配路由

```
//使用动态路由参数进行匹配所有 ID 各不相同的用户
const User = {
  template: '<div>User</div>'
}

const router = new VueRouter({
  routes: [
    // 动态路径参数 以冒号开头
    { path: '/user/:id', component: User }
  ]
})
访问：/user/1  张三
访问：/user/2  李四
```
#####  $route 对象

{% note success %}
复用组件时，对路由参数的变化作出响应的话，可以简单地 watch (监测变化) $route 对象
{% endnote %}

```
const User = {
template: '...',
watch: {
    '$route' (to, from) {
    // 对路由变化作出响应...
    }
}
}
或者另外一种方法
const User = {
template: '...',
beforeRouteUpdate (to, from, next) {
    // react to route changes...
    // don't forget to call next()
}
}
```

#### 匹配优先级

{% note warning %}
按照路由的定义顺序：谁先定义的，谁的优先级就最高。
{% endnote %}

#### 嵌套路由

```
/user/foo/profile                    
+------------------+                  
| User             |                  
| +--------------+ |                 
| | Profile      | |        
| |              | |                 
| +--------------+ |                  
+------------------+                  
```
```
<div id="app">
   <!-- 路由出口 -->
  <!-- 路由匹配到的组件将渲染在这里 -->
  <router-view></router-view>
</div>

const User = {
  template: `
    <div class="user">
      <h2>User {{ $route.params.id }}</h2>
      <!-- 子组件渲染到这里 -->
      <router-view></router-view>
    </div>
  `
}

const router = new VueRouter({
  routes: [
    { path: '/user/:id', component: User,
      children: [
        {
          // 当 /user/:id/profile 匹配成功，
          // UserProfile 会被渲染在 User 的 <router-view> 中
          path: 'profile',
          component: UserProfile
        }
      ]
    }
  ]
})
```

#### 编程式导航
##### router.push

{% note success %}
借助 router 的实例方法，通过编写代码来实现
在 Vue 实例内部，你可以通过 $router 访问路由实例。因此你可以调用 this.$router.push
router.push 方法：这个方法会向 history 栈添加一个新的记录，所以，当用户点击浏览器后退按钮时，则回到之前的 URL
{% endnote %}

{% note danger %}
注意：如果提供了 path，params 会被忽略，上述例子中的 query 并不属于这种情况。取而代之的是下面例子的做法，你需要提供路由的 name 或手写完整的带有参数的 path
{% endnote %}

###### 参数赋值
```
// 字符串
router.push('home')

// 对象
router.push({ path: 'home' })

// 命名的路由
router.push({ name: 'user', params: { userId: '123' }})

// 带查询参数，变成 /register?plan=private
router.push({ path: 'register', query: { plan: 'private' }})

const userId = '123'
router.push({ path: `/user/${userId}` }) // -> /user/123
// 这里的 params 不生效
router.push({ path: '/user', params: { userId }}) // -> /user
```
##### router.replace

{% note danger %}
唯一的不同就是，它不会向 history 添加新记录，而是跟它的方法名一样 —— 替换掉当前的 history 记录
{% endnote %}

##### router.go 类似window.history.go(n)

{% note success %}
参数是一个整数，在 history 记录中向前或者后退多少步
{% endnote %}
```
// 在浏览器记录中前进一步，等同于 history.forward()
router.go(1)

// 后退一步记录，等同于 history.back()
router.go(-1)

```
#### 路由命名
{% note success %}
用于区分不同的路由，主要是起到标识作用
{% endnote %}
```
const router = new VueRouter({
  routes: [
    {
      path: '/user/:userId',
      name: 'user',
      component: User
    }
  ]
})

//声明式导航
<router-link :to="{ name: 'user', params: { userId: 123 }}">User</router-link>
//编程式导航
router.push({ name: 'user', params: { userId: 123 }})
```
#### 命名视图
{% note success %}
同时 (同级) 展示多个视图，而不是嵌套展示
{% endnote %}

```
<!-- 没有写name等于默认值default -->
<router-view class="view one"></router-view>
<router-view class="view two" name="a"></router-view>
<router-view class="view three" name="b"></router-view>

const Foo={}
const Bar={}
const Baz={}

const router = new VueRouter({
  routes: [
    {
      path: '/',
      components: {
        default: Foo,
        a: Bar,
        b: Baz
      }
    }
  ]
})

```
#### 重定向

{% note success %}
命名的路由
动态返回重定向目标
/a 的别名是 /b，意味着，当用户访问 /b 时，URL 会保持为 /b，但是路由匹配则为 /a，就像用户访问 /a 一样
{% endnote %}

```
const router = new VueRouter({
  routes: [
    { path: '/a', redirect: '/b' }
    { path: '/a', redirect: { name: 'foo' }}
    { path: '/a', redirect: to => {
      // 方法接收 目标路由 作为参数
      // return 重定向的 字符串路径/路径对象
    }}
    { path: '/a', component: A, alias: '/b' }
  ]
})
```
#### 路由组件传参

##### 布尔模式

```
const User = {
  props: ['id'],
  template: '<div>User {{ id }}</div>'
}
const router = new VueRouter({
  routes: [
    { 
      path: '/user/:id', 
      component: User, 
      props: true 
    },
    // 对于包含命名视图的路由，你必须分别为每个命名视图添加 `props` 选项：
    {
      path: '/user/:id',
      components: { default: User, sidebar: Sidebar },
      props: { default: true, sidebar: false }
    }
  ]
})
```
##### 对象模式

```
const router = new VueRouter({
  routes: [
    { 
      path: '/promotion/from-newsletter', 
      component: Promotion, 
      props: { newsletterPopup: false } }
  ]
})
```
###### 函数模式

{% note info %}
URL /search?q=vue 会将 {query: 'vue'} 作为属性传递给 SearchUser 组件
{% endnote %}

```
const router = new VueRouter({
  routes: [
    { path: '/search', component: SearchUser, props: (route) => ({ query: route.query.q }) }
  ]
})

```
#### H5的hsitory模式

{% note danger %}
vue-router 默认 hash 模式 —— 使用 URL 的 hash 来模拟一个完整的 URL，于是当 URL 改变时，页面不会重新加载

需要后端配置[https://router.vuejs.org/zh/guide/essentials/history-mode.html#%E5%90%8E%E7%AB%AF%E9%85%8D%E7%BD%AE%E4%BE%8B%E5%AD%90]

{% endnote %}
```
const router = new VueRouter({
  mode: 'history',
  routes: [
    //404页面
    { path: '*', component: NotFoundComponent }
  ]
})
```
