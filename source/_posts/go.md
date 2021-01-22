---
title: 人生第一段Go语言代码块
tags: Golang
top_img: https://ae01.alicdn.com/kf/U25a99337d1d340aeb2e0ed1368fb83f2b.jpg
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://ae01.alicdn.com/kf/U25a99337d1d340aeb2e0ed1368fb83f2b.jpg
abbrlink: b454cac9
date: 2021-01-15 14:06:36
updated: 2021-01-15 14:06:36
top: 
categories: Golang
keywords: Go Golang
description:
mathjax:
katex:
aside:
aplayer:
highlight_shrink:
---

![图片源自网络](http://www.topgoer.com/static/home/2.jpg)

<blockquote class="blockquote-center">
忽略下一下一堆吧啦吧啦....哈哈哈哈
作为了解！！
<br>
Go 语言具有很强的表达能力，它简洁、清晰而高效。得益于其并发机制，用它编写的程序能够非常有效地利用多核与联网的计算机，其新颖的类型系统则使程序结构变得灵活而模块化。 Go 代码编译成机器码不仅非常迅速，还具有方便的垃圾收集机制和强大的运行时反射机制。 它是一个快速的、静态类型的编译型语言，感觉却像动态类型的解释型语言。
</blockquote>
{% note flat %}
Go中文文档地址: http://docscn.studygolang.com/doc/
Go中文介绍文档地址: http://www.topgoer.com/
Go教程文档：http://c.biancheng.net/golang/intro/
{% endnote %}

{% note info flat %}
Go适合做什么？
{% endnote %}
- 服务端开发
- 分布式系统，微服务
- 网络编程
- 区块链开发
- 内存KV数据库，例如boltDB、levelDB
- 云平台

Go项目目录
一个Go语言项目的目录一般包含以下三个子目录：
- src 目录：放置项目和库的源文件；
- pkg 目录：放置编译后生成的包/库的归档文件；
- bin 目录：放置编译后生成的可执行文件。

![图片源自网络](http://www.topgoer.com/static/2/4.png)

{% note red 'fas fa-fan' modern%}
人生第一个Go代码
{% endnote %}
```
package main    // 声明 main 包

import (
    "fmt"       // 导入 fmt 包，打印字符串是需要用到
    "rsc.io/quote" //导入其他外部包
)

func main() {   // 声明 main 主函数
    fmt.Println("Hello World!") // 打印 Hello World!
    // fmt.Println(quote.Glass())
}

```
- 声明一个 main 包（包是一种管理功能的方法）。
- 引用流行的 fmt 包, 其中包含格式化文本的功能，包含打印到控制台。这个包是一个 标准库包，在安装的 Go 的时候内置的。
- 实现 main 函数打印信息到控制台。 当执行你的代码时，main 函数是默认执行的。

{% note info flat %}
运行结果如下：
{% endnote %}
```
$ go run hello.go
Hello, World!
```
{% note red 'fas fa-fan' modern%}
引入其他代码外部包
{% endnote %}

- 访问 pkg.go.dev 并且 查找 "quote" 包.
- 在搜索结果中找到并点击 rsc.io/quote 包（ 当你看到 rsc.io/quote/v3 包时请暂时忽略）。
- 在左侧 Documentation(文档) 标签页面的 Index(索引) 下面的清单里列举的是你可以调用的功能（function）。你将使用的 Go语言 函数。
- 在页面的顶部，注意 quote 包是包含在 rsc.io/quote 模块中的。

{% note warning flat %}
在执行代码之前， go run 先查找并下载 rsc.io/quote 模块中包含你要引用的包。 默认情况下，它会下载最新的版本 -- v1.5.2。Go 构建命令会查找你引用包的指定模块
{% endnote %}