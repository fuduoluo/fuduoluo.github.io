---
title: 利用padding实现图片的自适应相等宽高
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 78cea6d8
date: 2019-07-11 22:58:01
updated: 2019-07-11 22:58:01
categories: css+padding图片自适应
tags: css
subtitle:
---
#### 思路：
##### 外层div高度为0
##### 设置relative
##### padding-top代替高度
1.
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-92d3e876f388aaa0.png)
<!--more-->
2.
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-4d9bd24405bc7db1.png)
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

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-5a628665dd31b157.png)

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

##### scrollTop、offsetHeight和offsetTop等属性用法详解以及兼容性的解决
>参考文章：
https://www.jianshu.com/p/d267456ebc0d
https://www.imooc.com/article/17571

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-9c8309e7f4721ee5.png)


![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-5482373cea82b41b.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-f79c00caa1c517fc.png)

#### 详解：
>1.scrollHeight:所有的内容(包括肉眼看不见、溢出、被窗口遮挡的部分；)

>2.clientHeight:野内可见的内容和内边距，不包括x轴的滚动条高度、边框、外边距(可见区域的底部左右滚动条不算)------元素宽高+Padding

#### clientHeight不包括border、水平滚动条、margin的元素的高度。对于inline的元素这个属性一直是0，单位px，只读元素


![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-33eaea347fc2c021.png)

>3.offsetHeight:在clientHeight的基础上， 加上边框和滚动条的高度------元素宽高+Padding+margin

#### offsetHeight不包括margin的元素的高度。对于inline的元素这个属性一直是0，单位px，只读元素。

>4.scrollTop: 在clientHeight区内滚动条滚动了多少距离（包括之前已滚动过的隐藏内容）

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-662f5cebbf36bd00.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/css/3098875-e9058c7980cd0397.png)

>5.scrollTop: 代表在有滚动条时，滚动条向下滚动的距离也就是元素顶部被遮住部分的高度。在没有滚动条时scrollTop==0恒成立。单位px，可读可设置。
>6.offsetTop: 当前元素顶部距离最近父元素顶部的距离,和有没有滚动条没有关系。单位px，只读元素。




