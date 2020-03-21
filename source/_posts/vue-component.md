---
title: Vue组件-自定义事件
permalink: "posts/:abbrlink.html"
top_img: （除非特定需要，可以不寫）
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://cdn.jsdelivr.net/npm/@bootcss/www.bootcss.com@0.0.3/dist/img/vuejs.png
tags: vue
categories: vue
keywords: Prop component VueComponnets
description: vue组件 vue自定义事件
abbrlink: 5fcafa01
date: 2020-02-20 09:15:45
updated: 2020-02-20 09:15:45
---


<blockquote class="blockquote-center">Vue组件学习</blockquote>
{% note warning %}
请注意实例化方法等使用Vue版本
{% endnote %}

#### 组件注册
- 组件大小写
    使用 kebab-case
        Vue.component('my-component-name', { /* ... */ })
    使用 PascalCase
        Vue.component('MyComponentName', { /* ... */ })
- 全局注册
    Vue.component('my-component-name', {
    // ... 选项 ...
    })
- 局部注册
    var ComponentA = { /* ... */ }
    new Vue({
    el: '#app',
    components: {
        'component-a': ComponentA,
    }
    })
    {% note success %}
    注意局部注册的组件在其子组件中不可用
    {% endnote %}
#### Prop

#### 自定义事件

![组件间通信](https://upload-images.jianshu.io/upload_images/3098875-702b90594a693cd8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

{% note warning %}
当子组件需要向父组件传递数据时，就要用到自定义事件
子组件用**\$ emit()来触发事件**，父组件在调用子组件上，加@事件名来监听子组件的事件。
{% endnote %}

{% note success %}
[摘自参考文章](https://segmentfault.com/a/1190000018809309)

##### 子向父的介质是自定义事件

- 1、子组件在 props 中创建一个属性，用以接收父组件传过来的值
  2、父组件中注册子组件
  3、在子组件标签中添加子组件 props 中创建的属性
  4、把需要传给子组件的值赋给该属性

##### 父向子的介质是 props 中的属性

- 1、子组件中需要以某种方式例如点击事件的方法来触发一个自定义事件
  2、将需要传的值作为\$emit 的第二个参数，该值将作为实参传给响应自定义事件的方法
  3、在父组件中注册子组件并在子组件标签上绑定对自定义事件的监听

##### 非父子组件的介质是中央事件总线

- 1、新建一个 eventBus.js 文件，在里面新建一个 vue 实例，这个实例就承担起了组件之间通信的桥梁了，也就是中央事件总线
  2、然后给每个子组件绑定一个方法(触发时候发布 eventBus),在每个子组件做一个订阅的监控,触发绑在 created 里的方法执行

{% endnote %}

##### 事件名

- 事件名命名规范
  ```
  this.$emit('myEvent')
  this.$emit('my-event')
  <my-component v-on:my-event="doSomething"></my-component>
  ```
  {% note danger %}
  推荐：始终使用 kebab-case 的事件名 [短横线分隔命名]
  {% endnote %}

##### 自定义事件

- 自定义事件及其注意点
  {% note info %}
  以下例子-父子组件传递值和监听事件
  {% endnote %}

  [\$emit 详解](https://cn.vuejs.org/v2/api/#vm-emit)
  [\$on 详解](https://cn.vuejs.org/v2/api/#vm-on)
  [\$attrs 详解](https://cn.vuejs.org/v2/api/#vm-attrs)
  [\$nextTick 详解](https://cn.vuejs.org/v2/api/#Vue-nextTick)
  [\$refs 详解](https://cn.vuejs.org/v2/guide/components-edge-cases.html#%E8%AE%BF%E9%97%AE%E5%AD%90%E7%BB%84%E4%BB%B6%E5%AE%9E%E4%BE%8B%E6%88%96%E5%AD%90%E5%85%83%E7%B4%A0)

  {% note success %}
  [摘自参考文章](https://blog.csdn.net/wh710107079/article/details/88243638)

  - \$refs 是一个对象，持有已注册过 ref 的所有的子组件
  - ref 被用来给元素或子组件注册引用信息， 引用信息将会注册在父组件的 \$refs 对象上，如果是在普通的 DOM 元素上使用，引用指向的就是 DOM 元素，如果是在子组件上，引用就指向组件的实例。
  - ref 加在普通的元素上，用 this.\$refs.（ref 值）  获取到的是 dom 元素
  - ref 加在子组件上，用 this.$refs.（ref值） 获取到的是组件实例，可以使用组件的所有方法。在使用方法的时候直接this.$refs.（ref 值）.方法（） 就可以使用了。
  - 如何利用 v-for 和 ref 获取一组数组或者 dom 节点
  - vue 组件中,加冒号的，说明后面的是一个变量或者表达式，没加冒号的后面就是对应的字符串字面量
    ```
    :val="numlist" :keys="index" //变量或者表达式
     val="numlist" keys="index" //字符串字面量
    ```

   {% endnote %}
    ```
       <!-- ref普通元素开始 -->
       <li ref="test">test</li>
       <ul>
           <template v-for="list in refslist">
               <li ref="refslist">{{list}}</li>
           </template>
       </ul>
       <!-- ref普通元素结束 -->
       <!-- ref子组件开始 -->
       <my-event ref="handles">$ref用法</my-event>
       <!-- ref子通组件结束 -->

       Vue.component('my-event', {
           template: '<p></p>',
           methods: {
               emitEvent: function (e) {
                   console.log('父组件调用到子组件的emitEvent方法----' + e)
               }
           },
       });
       getChildmsg: function () {
           var _this = this;
           this.$nextTick(() => {
               _this.$refs.handles.emitEvent('我是父组件中的数据');
               //调用子组件的方法，handles是上边ref起的名字，emitEvent是子组件的方法。
           })
           this.$nextTick(() => {
               // for获取到DOM元素
               var content = _this.$refs.refslist;
               console.log(content);//(4) [li, li, li, li]
           })
           this.$nextTick(() => {
               //普通元素
               var _this = this;
               var tets = _this.$refs.test;
               console.log(tets);//<li>test</li>
           })
       }
    ```

  ![坑](https://upload-images.jianshu.io/upload_images/3098875-6b651793500e3177.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

  ```
    <div id="app">
        <my-component @increase="handleShow"  v-for="(numlist,index) in list" :val="numlist" :keys="index">
        </my-component>
        <my-event ref="handles">$ref用法</my-event>
        <button @click="getChildmsg">触发子组件函数</button>
        <!--父组件中通过监测my-event事件执行一个方法，然后取到子组件中传递过来的值-->
        <p>
            子组件回传父组件接收到的数据--{{message}}
        </p>
    </div>
    <script>
        Vue.component('my-component', {
            props: ['val', 'keys'],
            template: '<li @click="handleIncrease">{{keys}}---{{val}}--{{nums}}</li>',
            data: function () {
                return {
                    nums: '0'
                }
            },
            methods: {
                handleIncrease: function () {
                    this.nums++;
                    console.log('子组件点击事件由$emit触发--' + this.nums);
                    this.$emit('increase', this.nums);
                },
                emitEvent: function (e) {
                    console.log('父组件调用到子组件的emitEvent方法'+e)
                }
            },
            mounted() {
                var _this = this
                _this.$on('increase', function (val) {
                    // 监听当前实例上的自定义事件,回调函数会接收所有传入事件触发函数的额外参数
                    console.log('子组件向父组件传递值---' + val);
                });
            },
        });

        Vue.component('my-event', {
            template: '<p></p>',
            methods: {
                emitEvent: function (e) {
                    console.log('父组件调用到子组件的emitEvent方法----'+e)
                }
            },
        });

        var app = new Vue({
            el: '#app',
            data: {
                list: ['test', 'props', 'vue', 'app'],
                message: '',
                refslist:{
                    content:'test'
                }
            },
            methods: {
                handleShow: function (val) {
                    var _this = this;
                    // 父组件中通过监测my-event事件执行一个方法，然后取到子组件中传递过来的值
                    _this.message = val;
                    console.log('父组件接收的数据------>' + val + '子组件中的数据');
                },
                getChildmsg: function () {
                    var _this = this;
                    //DOM修改等操作未更新
                    this.$nextTick(()=>{
                        //DOM修改等操作已更新
                        //此时的$ref是指子组件实例所以可以使用子组件的所有方法
                        _this.$refs.handles.emitEvent('我是父组件中的数据');
                    })
                    //调用子组件的方法，handles是上边ref起的名字，emitEvent是子组件的方法。
                }
            }
        });

    </script>
    ```

![效果](https://upload-images.jianshu.io/upload_images/3098875-8b90ab97e6eff302.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- v-model 使用[移步](/posts/f4917a63.html)

##### 绑定原生事件至组件中

- 如何绑定原生事件至组件
  {% note info %}
  Vue中$attrs和$listeners的使用---解决组件通信
  {% endnote %}
  [移步](/posts/48944071.html)
##### .sync 修饰符

- .sync 修饰符
  {% note info %}
  深入理解vue 修饰符sync【 vue sync修饰符示例】
  {% endnote %}
  [移步]( https://www.jianshu.com/p/6b062af8cf01)
