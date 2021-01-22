---
title: Golang基本内置类型和字面量形式
tags: Golang
top_img: https://ae01.alicdn.com/kf/U25a99337d1d340aeb2e0ed1368fb83f2b.jpg
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://ae01.alicdn.com/kf/U25a99337d1d340aeb2e0ed1368fb83f2b.jpg
abbrlink: be14731a
date: 2021-01-22 10:34:35
updated: 2021-01-22 10:34:35
top:
categories: Golang
keywords: Go Golang
description: Golang基本内置类型和字面量形式
mathjax:
katex:
aside:
aplayer:
highlight_shrink:
---

{% note info flat %}
以下笔记来自网络作为笔记查阅-如有侵犯,留言联系本人删除
{% endnote %}


[计算机进制之间的换算](https://www.cnblogs.com/rinack/p/12993315.html)
[计算机中的Byte、bit、字、字长、字节](https://www.cnblogs.com/sunlightlee/p/10393008.html)

{% note primary flat %}
Go支持内置基本类型
{% endnote %}

{% note 'fab fa-codiepie' modern %}
主要分三种：布尔 字符串 数值[整型 浮点型 复数型]
{% endnote %}

- 一种内置布尔类型：bool。
- 11种内置整数类型：int8、uint8、int16、uint16、int32、uint32、int64、uint64、int、uint和uintptr。
- 两种内置浮点数类型：float32和float64。
- 两种内置复数类型：complex64和complex128。
- 一种内置字符串类型：string


{% note warning flat %}
Go中有两种内置类型别名（type alias）：
byte是uint8的内置别名。 我们可以将byte和uint8看作是同一个类型。
rune是int32的内置别名。 我们可以将rune和int32看作是同一个类型。
{% endnote %}

{% note warning flat %}
所有的内置基本类型的名称都是非导出标识符-[私有]
我们使用字节（byte）做为值尺寸的度量单位。 一个字节相当于8个比特。所以uint32类型的尺寸为4，即每个uint32值占用4个字节。
{% endnote %}

- 以u开头的整数类型称为无符号整数类型。 无符号整数类型的值都是非负的。
- 一个数值类型名称中的数字表示每个这个类型的值将在内存中占有多少二进制位（以后简称位）。二进制位常称为比特（bit）。 比如，一个uint8的值将占有8位。 我们称uint8类型的值的尺寸是8位。 

{% note primary flat %}
零值
{% endnote %}
每种类型都有一个零值。一个类型的零值可以看作是此类型的默认值。
- 一个布尔类型的零值表示真假中的假。
- 数值类型的零值都是零（但是不同类型的零在内存中占用的空间可能不同）。
- 一个字符串类型的零值是一个空字符串。

{% note primary flat %}
基本类型的字面量表示形式
{% endnote %}

{% note info flat %}
一个值的字面形式称为一个字面量，它表示此值在代码中文字体现形式（和内存中的表现形式相对应）。一个值可能会有很多种字面量形式。
{% endnote %}

{% note green 'fab fa-connectdevelop' modern %}
布尔值的字面量形式
{% endnote %}

- 布尔类型的零值可以使用预声明的false来表示。

{% note green 'fab fa-connectdevelop' modern %}
整数型值的字面量形式
{% endnote %}

- 十进制形式（decimal）、八进制形式（octal）、十六进制形式（hex）和二进制形式（binary）

```
0xF // 十六进制表示（必须使用0x或者0X开头）
0XF

017 // 八进制表示（必须使用0、0o或者0O开头）
0o17
0O17

0b1111 // 二进制表示（必须使用0b或者0B开头）
0B1111

15  // 十进制表示（必须不能用0开头）
```

{% note green 'fab fa-connectdevelop' modern %}
浮点数类型值的字面量形式
{% endnote %}

```
1.23
01.23 // == 1.23
.23
1.
// 一个e或者E随后的数值是指数值（底数为10）。
// 指数值必须为一个可以带符号的十进制整数字面量。
1.23e2  // == 123.0
123E2   // == 12300.0
123.E+2 // == 12300.0
1e-1    // == 0.1
.1e0    // == 0.1
0010e-2 // == 0.1
0e+5    // == 0.0
```
{% note blue 'fab fa-codiepie' modern %}
在一个十六进制浮点数文字表示中，
和整数的十六进制文字表示一样，浮点数的十六进制文字表示也必须使用0x或者0X开头。
和整数的十六进制文字表示不同的是，字母p或者P可以出现在浮点数的十六进制文字表示中，其后跟随着一个幂指数（底数为2）。
另外要注意，e和E不能出现在浮点数的十六进制文字表示中。
yPn表示y乘以2n的意思，而yP-n表示y除以2n
{% endnote %}

```
合法：
0x1p-2     // == 0.25
0x2.p10    // == 2048.0
0x1.Fp+0   // == 1.9375
0X.8p-0    // == 0.5
0X1FFFP-16 // == 0.1249847412109375

不合法：
0x.p1    // 整数部分表示必须包含至少一个数字
1p-2     // p指数形式只能出现在浮点数的十六进制文字表示中
0x1.5e-2 // e和E不能出现在浮点数的十六进制文字表示中

合法但不是浮点数16进制文字表示
0x15e-2 // == 0x15e - 2 (整数相减表达式)
e为是十进制中的14，0x15e为一个整数十六进制文字表示，-2并不是此整数十六进制文字表示的一部分
```
浮点类型的零值的标准字面量形式为0.0，比如0.、.0、0e0和0x0p0等也是

{% note green 'fab fa-connectdevelop' modern %}
复数类型值的字面量形式
虚部字面量形式:虚部字面量用来表示复数的虚部
{% endnote %}

{% note warning flat %}
1.形如Z=a+bi形式叫复数
2.一个虚部值的字面量形式由一个浮点数字面量或者一个整数字面量和其后跟随的一个小写的字母i组成。 在Go 1.13之前，如果虚部中i前的部分为一个整数字面量，则其必须为并且总是被视为十进制形式。
3.复数零值的标准字面表示为0.0+0.0i。 当然0i、.0i、0+0i等表示也是合法的。
{% endnote %}

```
1.23i
1.i
.23i
123i
0123i   // == 123i（兼容性使然。见下）
1.23E2i // == 123i
1e-1i
011i   // == 11i（兼容性使然。见下）
00011i // == 11i（兼容性使然。见下）
// 下面这几行从Go 1.13开始才能编译通过。
0o11i    // == 9i
0x11i    // == 17i
0b11i    // == 3i
0X.8p-0i // == 0.5i

复数值的字面量形式
1 + 2i       // == 1.0 + 2.0i
1. - .1i     // == 1.0 + -0.1i
1.23i - 7.89 // == -7.89 + 1.23i
1.23i        // == 0.0 + 1.23i
```


{% note green 'fab fa-connectdevelop' modern %}
数值字面表示中使用下划线分段来增强可读性
{% endnote %}

- 下划线_可以出现在整数、浮点数和虚部数字面量中
- 在一个数值字面表示中，一个下划线_不能出现在此字面表示的首尾，并且其两侧的字符必须为（相应进制的）数字字符或者进制表示头

```
// 合法的使用下划线的例子
6_9          // == 69
0_33_77_22   // == 0337722
0x_Bad_Face  // == 0xBadFace
0X_1F_FFP-16 // == 0X1FFFP-16
0b1011_0111 + 0xA_B.Fp2i

// 非法的使用下划线的例子
_69        // 下划线不能出现在首尾
69_        // 下划线不能出现在首尾
6__9       // 下划线不能相连
0_xBadFace // x不是一个合法的八进制数字
1_.5       // .不是一个合法的十进制数字
1._5       // .不是一个合法的十进制数字
```

{% note green 'fab fa-connectdevelop' modern %}
rune值的字面量形式
rune类型是int32类型的别名
rune类型（泛指）是特殊的整数类型
{% endnote %}

- 在Go中，一个rune值表示一个Unicode码点，看做一个Unicode字符，有些是多个字符组成多个的码点
- rune类型的零值常用 '\000'、'\x00'或'\u0000'等来表示。

```
'a' // 一个英文字符
'π'
'众' // 一个中文字符
'\141'   // 141是97的八进制表示
'\x61'   // 61是97的十六进制表示
'\u0061'
'\U00000061'
以上都是等价
```

{% note green 'fab fa-connectdevelop' modern %}
字符串值的字面量形式
字符串类型的零值在代码里用 ""或``表示。
{% endnote %}

Go字符串的字面量形式有两种。 
- 一种是解释型字面表示（interpreted string literal，双引号风格）。
- 另一种是直白字面表示（raw string literal，反引号风格）

```
// 解释形式
"Hello\nworld!\n\"你好世界\""

// 直白形式
`Hello
world!
"你好世界"
```


![Golang基本数值类型字面量的适用范围例子](https://ae01.alicdn.com/kf/Ub5eb4240c11945c7968fa1fb9569e6f41.jpg)