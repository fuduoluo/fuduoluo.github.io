---
title: Vue组件-v-model使用
permalink: "posts/:abbrlink.html"
top_img: （除非特定需要，可以不寫）
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://cdn.jsdelivr.net/npm/@bootcss/www.bootcss.com@0.0.3/dist/img/vuejs.png
abbrlink: f4917a63
date: 2020-02-20 16:42:06
updated: 2020-02-20 16:42:06
tags: vue
categories: vue
keywords:
description: v-model使用
---

<meta name="referrer" content="never">
<blockquote class="blockquote-center">v-model使用</blockquote>

[组件间使用v-model参考文章](https://segmentfault.com/a/1190000010744545)

#### 文本

```
<div>
 <input type="text" placeholder="请输入" v-model="inputText">
 第一个input输入的文本为：{{inputText}}
</div>
```

#### 多行文本

```
<div>
    <textarea placeholder="请输入多行文本" v-model="textArea"></textarea>
    textarea输入的文本为：{{textArea}}
</div>
```

#### 多个复选框

```
 <div>
     <input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
     <label for="jack">Jack</label>
     <input type="checkbox" id="john" value="John" v-model="checkedNames">

     <label for="john">John</label>
     <input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
     <label for="mike">Mike</label>
     <br>
     <span>Checked names: {{ checkedNames }}</span>
</div>
```

#### 选泽框[单，多选]

```
<div>
  <select v-model="selected">
     <option disabled value="">请选择</option>
     <option>A</option>
     <option>B</option>
     <option>C</option>
   </select>
   <span>单选时: {{ selected }}</span>
 </div>

<div>
    <select v-model="selectedArr" multiple style="width: 50px;">
        <option>A</option>
        <option>B</option>
        <option>C</option>
    </select>
    <br>
    <span>多选时，绑定一个数组: {{ selectedArr }}</span>
</div>
```
