---
title: 服务器配置SSL证书
tags: SSL Nginx
top_img: https://ae01.alicdn.com/kf/U64b71c8662fa4ebaabbba516613a2321K.jpg
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
# copyright_author: 文章版權模塊的文章作者
# copyright_author_href: 文章版權模塊的文章作者鏈接
# copyright_url: 文章版權模塊的文章連結鏈接
# copyright_info: 文章版權模塊的版權聲明文字
cover: https://ae01.alicdn.com/kf/U64b71c8662fa4ebaabbba516613a2321K.jpg
categories: Nginx SSL
keywords: SSL Nginx
description: 从0到1配置服务器SSL证书
abbrlink: 8c7ebb37
date: 2020-12-31 16:02:25
updated: 2020-12-31 16:02:25
top:
mathjax:
katex:
aside:
aplayer:
highlight_shrink:
---

<blockquote class="blockquote-center">
小白入手配置SSL过程~
</blockquote>

{% note warning flat %}
常见未没有进行配置SSL证书网站
{% endnote %}

![未进行配置SSL证书](https://ae01.alicdn.com/kf/Ua64f053a66a9448d97a2cfecc38acd7eZ.jpg)

{% note success flat %}
常见已配置SSL证书网站
{% endnote %}

![已配置SSL证书](https://ae01.alicdn.com/kf/Uf5ee854d61324fb48a0165e9d9e6f83eK.jpg)

{% note red 'fas fa-bullhorn' modern %}
开始啦......
温馨提示：服务器上的80和443端口一定要确认有开启并运行状态为正常
{% endnote %}



{% note success flat %}
免费申请阿里云SSL证书 [CA证书]
{% endnote %}


{% note green 'fab fa-internet-explorer' modern%}
登录阿里云进入云盾证书服务购买页,进行购买CA证书
免费Symantec只能用于一个域名，所以建议大家填写带www的，如：www.laputcat.top
{% endnote %}
![CA证书购买页](https://ae01.alicdn.com/kf/U51e666c048e3442bb220be99152f4a030.jpg)

{% note green 'fab fa-internet-explorer' modern%}
根据提示为SSL证书补全域名和个人信息
{% endnote %}

{% note green 'fab fa-internet-explorer' modern%}
域名授权认证
{% endnote %}
- 如果你的域名本身就在阿里云的话这个授权就简单了。你只要选择DNS验证方式，那么证书审核通过之后会自动的添加一条域名解析记录。
- 购买了阿里云的主机和服务器，域名还在其他服务商那里.只要自己给域名添加一条DNS解析记录就可以。
![在域名解析上增加一条解析记录](https://ae01.alicdn.com/kf/U71b3d7600af0450dbda1558a3900cabfW.jpg)

- 等待阿里云对与SSL证书的审核：出现以下情况说明是审核通过
![审核通过](https://ae01.alicdn.com/kf/U2b48d875d106429a91b67d708ad48fa0P.jpg)

- 下载证书解压到本地
- 复制粘贴至宝塔控制面板进行保存，之后进行重启服务器
![粘贴至宝塔面板](https://ae01.alicdn.com/kf/U4db36982fcf74f30af6f6b29544f8e19M.jpg)

- 直接访问域名地址，查看是否配置成功

{% note warning flat %}
配置完成后可能出现的问题如下：
{% endnote %}

- 配置完访问显示还是提示不安全

{% note success flat %}
一句话：你没有全站都使用https。具体来说就是对网站所使用的资源（如图片、嵌入文件或视频等）的引用，其来源地址也必须是https链接才行
比如img使用的http
{% endnote %}

- 配置完访问不了

{% note success flat %}
检查端口号是否开启如：安全组开放443端口或是80端口
{% endnote %}

![参考图片](http://www.xiaoyunhua.com/wp-content/uploads/2019/04/safety-pic.png)


{% note info flat %}
本站点由于有使用到其他的资源等http，所以我完成配置后还是显示不安全。数量过多就没有花时间去整理~~~~
{% endnote %}

[参考文章](https://yq.aliyun.com/articles/637307)
[参考文章](http://www.xiaoyunhua.com/3454.html)
