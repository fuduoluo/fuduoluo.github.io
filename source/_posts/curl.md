---
title: PHP模拟发送CURL请求
permalink: 'posts/:abbrlink.html'
top_img: http://image.laputcat.top/blog/php.jpg
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: http://image.laputcat.top/blog/php.jpg
abbrlink: 3e01b4d
date: 2020-05-14 13:49:24
updated: 2020-05-14 13:49:24
tags: PHP
categories: PHP
keywords: CURL PHP
description: 模拟发送CURL请求
---

<blockquote class="blockquote-center">PHP使用Curl模拟发送请求</blockquote>
{% note success %}
主要用于第三方接口请求使用，接收请求数据接口返回数据。模拟发送POST请求
{% endnote %}

### 用于传递二维数组参数
```
    public function curlPost($url, $rawData)
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);//解决页面出现 Object moved to here
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		// 使用一维数组使用下面这个
		// 默认拼接参数使用application/x-www-form-urlencoded
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
			'multipart/form-data'
		));
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $rawData);
		$data = curl_exec($ch);
		curl_close($ch);
		return ($data);
	}
```
### 用于传递一维数组参数
```
    //一维数组参数：
    public function curlPostJson($url, $rawData)
	{
	
		$postJsonString=json_encode($rawData);
		$ch=curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
		
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $postJsonString);
        //声明发送请求数据格式并返回字符串长度
		curl_setopt($ch, CURLOPT_HTTPHEADER, 
            array('Content-Type: application/json;charset=utf-8', 'Content-Length: ' . strlen($postJsonString)
            )
        );
		$data = curl_exec($ch);
		curl_close($ch);
		$this->_writeLog($data);
		return $data;
	}
```
{% note success %}
模拟发送GET请求
{% endnote %}
```
	private	function _curlGet($url,$accessToken)
	{				
		//添加表头参数
        $headerParmas = array(
			"Authorization:Bearer ".$accessToken
		);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
		curl_setopt($ch, CURLOPT_HTTPHEADER,$headerParmas);
		$file_contents = curl_exec($ch);
		curl_close($ch);
		return $file_contents;
	}
```