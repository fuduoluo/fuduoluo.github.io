---
title: centos7 宝塔[LNMP] 访问swoole服务问题

top_img: https://img.php.cn/upload/article/000/000/007/2f6af5226adfeb6e67b09841b303e379.jpg
comments: '是否顯示評論（除非設置false,可以不寫）'
cover: https://img.php.cn/upload/article/000/000/007/2f6af5226adfeb6e67b09841b303e379.jpg
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
tags: Swoole
categories: Swoole
keywords: swoole nginx httpserver 
description: 'centos7 宝塔[LNMP] 访问swoole服务问题'
abbrlink: 593ef122
date: 2019-11-02 18:09:37
updated: 2019-11-02 18:09:37
---

<blockquote class="blockquote-center"></blockquote>
{% note success flat %}
centos7 宝塔[LNMP] 访问swoole服务问题
{% endnote %}

### centos7 宝塔安装LNMP环境
- 已集成swoole服务+异步redis
- 已配置好虚拟域名 www.swoole.live 访问TP根目录
- 采用TP5.1框架
- 请先关闭linux防火墙
```
firewall防火墙
1、查看firewall服务状态
systemctl status firewalld
出现Active: active (running)切高亮显示则表示是启动状态。
出现 Active: inactive (dead)灰色表示停止，看单词也行。
2、开启 关闭 重启 开机禁止
service firewalld  start
service firewalld  stop
service firewalld  restart
systemctl disable firewalld
```
<!--more-->
##### 通过虚拟域名访问swoole的httpserver服务失败 

```
出现以下两个问题
http:\/\/www.swoole.live:9501/live/detail.html
1.域名+端口访问httpserver服务一直出现无法连接状态 
2.域名+端口访问httpserver服务成功后并设置静态文件选项，一直无法加载出来

- 重新复制并改写nginx的配置文件  /vhosts/swoole.conf
- 在nginx.conf主文件引入swoole.conf
```
```
server
{
    listen 80;
    server_name www.swoole.live;
	root /www/wwwroot/www.swoole.live/public/;
	index index.php index.html index.htm default.php default.htm default.html;

    #SSL-START SSL相关配置，请勿删除或修改下一行带注释的404规则
    #error_page 404/404.html;
    #SSL-END
    
    #ERROR-PAGE-START  错误页配置，可以注释、删除或修改
    #error_page 404 /404.html;
    #error_page 502 /502.html;
    #ERROR-PAGE-END
    
    #PHP-INFO-START  PHP引用配置，可以注释或修改
    include enable-php-72.conf;
    #PHP-INFO-END
    
    #以下参照swoole手册  放在这个位置是因为访问是swoole.php 的PHP后缀文件
    location ~ \.php$ {
    	# 通过PHP-FPM进行解析PHP文件
    	#fastcgi_pass 127.0.0.1:9000;
		fastcgi_pass unix:/tmp/php-cgi-72.sock;#设置监听并开启fpm服务
		fastcgi_index index.php;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		include fastcgi_params;
		# 访问swoole http\server 服务配置内容如下
		proxy_http_version 1.1;
        proxy_set_header Connection "keep-alive";
        proxy_set_header X-Real-IP $remote_addr;
        if (!-e $request_filename) {
             proxy_pass http://192.168.33.110:9501;#最重要是通过代理进行转发
        }
	}
    
    
    
    #禁止访问的文件或目录
    location ~ ^/(\.user.ini|\.htaccess|\.git|\.svn|\.project|LICENSE|README.md)
    {
        return 404;
    }
    
    #一键申请SSL证书验证目录相关设置
    location ~ \.well-known{
        allow all;
    }
    
    location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
    {
        expires      30d;
        error_log off;
        access_log /dev/null;
    }
    
    location ~ .*\.(js|css)?$
    {
        expires      12h;
        error_log off;
        access_log /dev/null; 
    }
    access_log  /www/wwwlogs/www.swoole.live.log;
    error_log  /www/wwwlogs/www.swoole.live.error.log;
}
```
结果如下：
![访问服务成功](https://ae01.alicdn.com/kf/Uf28781cb630e423cb2d4f708873dcb01X.jpg)

[swoole 之http服务器静态资源](https://blog.csdn.net/hudeyong926/article/details/99540724)
```
<?php

class Http {
    CONST HOST = '192.168.33.123';
    CONST PORT = '9501';
    CONST ENABLE_STATIC_HANDLER = TRUE;
    CONST DOCUMENT_ROOT = '/www/wwwroot/www.swoole.live/public/static';
    
    private $http = null;
    public function __construct() {
        $this->http = new Swoole\Http\Server(self::HOST, self::PORT);
        //静态文件加载失败----document_root单词写错！！！！
        $this->http->set([
             'enable_static_handler' => self::ENABLE_STATIC_HANDLER,
             'document_root' =>self::DOCUMENT_ROOT,
        ]);
        $this->http->on('request', [$this, 'onRequest']);
        $this->http->start();
    }
    /**
     * onRequest function 
     *
     * @param [type] $request
     * @param [type] $response
     * @return void
     * @Description  
     * @author 
     * @date 2019-10-26
     */
	 public function onRequest($request, $response) {
        $response->header("Content-Type", "text/html; charset=utf-8");
        $response->end("" . rand(1000, 9999));
    }
}
new Http();//实例化http类
```
结果如下：
![加载静态资源成功](https://ae01.alicdn.com/kf/Ubbe80be981c647d799902643508ebdaes.jpg)


