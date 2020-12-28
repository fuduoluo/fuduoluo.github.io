---
title: {{ title }}
date: {{ date }}
updated: {{ date }}
tags: 文章標籤
top:
categories:
keywords:
description:
abbrlink: 
top_img: 文章頂部圖片
comments:  true
toc:  是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
copyright_author: 文章版權模塊的文章作者
copyright_author_href: 文章版權模塊的文章作者鏈接
copyright_url: 文章版權模塊的文章連結鏈接
copyright_info: 文章版權模塊的版權聲明文字
cover:  縮略圖
mathjax:
katex:
aside:
aplayer:
highlight_shrink:
---

<blockquote class="blockquote-center"></blockquote>
<span id="inline-yellow">黄色色块</span>

<span id="inline-green">绿色色块</span>

<p id="div-border-left-red">左边框红色块级</p>

<p id="div-border-right-red">右边框红色块级</p>

<p id="div-border-top-blue">上边框蓝色块级</p>

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
info 提示塊標籤
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

