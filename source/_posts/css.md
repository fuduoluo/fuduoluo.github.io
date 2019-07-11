---
title: 利用padding实现图片的自适应相等宽高
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 78cea6d8
date: 2019-07-11 22:58:01
updated: 2019-07-11 22:58:01
categories: css
tags: css
subtitle:
---
#### 思路：
##### 外层div高度为0
##### 设置relative
##### padding-top代替高度
1.
![image.png](https://upload-images.jianshu.io/upload_images/3098875-92d3e876f388aaa0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
<!--more-->
2.
![image.png](https://upload-images.jianshu.io/upload_images/3098875-4d9bd24405bc7db1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
> 加上 display: block;是因为a标签是行级标签



```
.im a {
    width: 100%;
    height: 0;
    position: relative;
    padding-top: 100%;
    display: block;
}
.im a img {
    position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    left: 0;
}
```

>同样做法:图片大小不一致导致布错乱

![image.png](https://upload-images.jianshu.io/upload_images/3098875-5a628665dd31b157.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
html：
<li class="col-sm-3 products_views" id="13333">
	<div class="diy-products_list">
		<a title="图片.png" href="链接">
			<picture class="als-content-results-item__pic">
				<img src="图片.png" id="magic_13333" class="lzay img-responsive" data-original="图片.png" alt="" title="">
			</picture>
		 </a>
	</div>
	<div class="themeText">图片.png</div>
</li>
```
```
css:
.diy-products_list a {
    display: block;
    background: #f2f2f2;
}
.als-content-results-item__pic {
    display: block;
    height: 0;
    padding-bottom: 100%;/*重点*/
    overflow: hidden;/*超出部分隐藏--重点*/
}
.img-responsive{
    display: block;
    max-width: 100%;
    height: auto;
}
```


