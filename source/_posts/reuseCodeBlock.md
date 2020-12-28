---
title: 前端常用代码块

top_img: （除非特定需要，可以不寫）
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://i.loli.net/2020/03/22/wbdnqsPIQ38KvDR.png
abbrlink: 5066d279
date: 2019-12-04 10:52:37
updated: 2019-12-04 10:52:37
tags: codeBlock  
categories: codeBlock
keywords:
description:
---

<blockquote class="blockquote-center"></blockquote>
{% note success flat %}
前端常用代码块或JS
{% endnote %}

#### 适配基础知识

- 1.什么是rem
    CSS3新增的一个相对单位rem（root em,根em）.rem是相对于根节点（或者是html节点）.
    如果根节点设置了font-size:10px;那么font-size:1.2rem;字体大小等于12px

- 2.什么是dpr
    dpr就是设备物理像素与逻辑像素(css像素)的比例.
    设备物理像素是固定的,比如macbook pro 13.3寸是显示屏分辨率是2560 x 1600,
    物理像素:2560就是当前设备的物理像素
    逻辑像素:浏览器全屏幕宽只有1280
    dpr所表示的就是：1280的浏览器被扩展成2560像素宽度,2个物理像素对应一个逻辑像素.

    再比如在开发中,一张设计好的宽度为100px,高度为50px的图片,再dpr值为2的设备中,宽度设置为100px的话,
    他实际会被扩展到200像素宽度,只有设为50的时候才会正常显示.

- 3.获取DPR
    浏览器控制台中输入:window.devicePixelRatio

- 4.说明
    针对不同手机屏幕尺寸和dpr动态的改变根节点html的font-size大小(基准值)。
    rem = document.documentElement.clientWidth * dpr / 10
    说明：
    乘以dpr，是因为页面有可能为了实现1px border页面会缩放(scale) 1/dpr 倍(如果没有，dpr=1),。
    除以10，是为了取整，方便计算(理论上可以是任何值)
    所以就像下面这样，html的font-size可能会：
    iphone3gs: 320px / 10 = 32px
    iphone4/5: 320px * 2 / 10 = 64px
    iphone6: 375px * 2 / 10 = 75px


#### 淘宝方案解决以下问题

- border: 1px问题
- 图片高清问题
- 屏幕适配布局问题


#### H5淘宝适配方案
```
function(N, M) {
	function L() {
		var a = I.getBoundingClientRect().width;
		a / F > 540 && (a = 540 * F);
		var d = a / 10;
		I.style.fontSize = d + "px", D.rem = N.rem = d
	}
	var K, J = N.document,
		I = J.documentElement,
		H = J.querySelector('meta[name="viewport"]'),
		G = J.querySelector('meta[name="flexible"]'),
		F = 0,
		E = 0,
		D = M.flexible || (M.flexible = {});
	if (H) {
		console.warn("将根据已有的meta标签来设置缩放比例");
		var C = H.getAttribute("content").match(/initial\-scale=([\d\.]+)/);
		C && (E = parseFloat(C[1]), F = parseInt(1 / E))
	} else {
		if (G) {
			var B = G.getAttribute("content");
			if (B) {
				var A = B.match(/initial\-dpr=([\d\.]+)/),
					z = B.match(/maximum\-dpr=([\d\.]+)/);
				A && (F = parseFloat(A[1]), E = parseFloat((1 / F).toFixed(2))), z && (F = parseFloat(z[1]), E = parseFloat((1 / F).toFixed(2)))
			}
		}
	}
	if (!F && !E) {
		var y = N.navigator.userAgent,
			x = ( !! y.match(/android/gi), !! y.match(/iphone/gi)),
			w = x && !! y.match(/OS 9_3/),
			v = N.devicePixelRatio;
		F = x && !w ? v >= 3 && (!F || F >= 3) ? 3 : v >= 2 && (!F || F >= 2) ? 2 : 1 : 1, E = 1 / F
	}
	if (I.setAttribute("data-dpr", F), !H) {
		if (H = J.createElement("meta"), H.setAttribute("name", "viewport"), H.setAttribute("content", "initial-scale=" + E + ", maximum-scale=" + E + ", minimum-scale=" + E + ", user-scalable=no"), I.firstElementChild) {
			I.firstElementChild.appendChild(H)
		} else {
			var u = J.createElement("div");
			u.appendChild(H), J.write(u.innerHTML)
		}
	}
	N.addEventListener("resize", function() {
		clearTimeout(K), K = setTimeout(L, 300)
	}, !1), N.addEventListener("pageshow", function(b) {
		b.persisted && (clearTimeout(K), K = setTimeout(L, 300))
	}, !1), "complete" === J.readyState ? J.body.style.fontSize = 12 * F + "px" : J.addEventListener("DOMContentLoaded", function() {
		J.body.style.fontSize = 12 * F + "px"
	}, !1), L(), D.dpr = N.dpr = F, D.refreshRem = L, D.rem2px = function(d) {
		var c = parseFloat(d) * this.rem;
		return "string" == typeof d && d.match(/rem$/) && (c += "px"), c
	}, D.px2rem = function(d) {
		var c = parseFloat(d) / this.rem;
		return "string" == typeof d && d.match(/px$/) && (c += "rem"), c
	}
}(window, window.lib || (window.lib = {})); 

```
#### 重置CSS默认样式

```
@charset "utf-8";html{background-color:#fff;color:#000;font-size:12px}
body,ul,ol,dl,dd,h1,h2,h3,h4,h5,h6,figure,form,fieldset,legend,input,textarea,button,p,blockquote,th,td,pre,xmp{margin:0;padding:0}
body,input,textarea,button,select,pre,xmp,tt,code,kbd,samp{line-height:1.5;font-family:tahoma,arial,"Hiragino Sans GB",simsun,sans-serif}
h1,h2,h3,h4,h5,h6,small,big,input,textarea,button,select{font-size:100%}
h1,h2,h3,h4,h5,h6{font-family:tahoma,arial,"Hiragino Sans GB","微软雅黑",simsun,sans-serif}
h1,h2,h3,h4,h5,h6,b,strong{font-weight:normal}
address,cite,dfn,em,i,optgroup,var{font-style:normal}
table{border-collapse:collapse;border-spacing:0;text-align:left}
caption,th{text-align:inherit}
ul,ol,menu{list-style:none}
fieldset,img{border:0}
img,object,input,textarea,button,select{vertical-align:middle}
article,aside,footer,header,section,nav,figure,figcaption,hgroup,details,menu{display:block}
audio,canvas,video{display:inline-block;*display:inline;*zoom:1}
blockquote:before,blockquote:after,q:before,q:after{content:"\0020"}
textarea{overflow:auto;resize:vertical}
input,textarea,button,select,a{outline:0 none;border: none;}
button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}
mark{background-color:transparent}
a,ins,s,u,del{text-decoration:none}
sup,sub{vertical-align:baseline}
html {overflow-x: hidden;height: 100%;font-size: 50px;-webkit-tap-highlight-color: transparent;}
body {font-family: Arial, "Microsoft Yahei", "Helvetica Neue", Helvetica, sans-serif;color: #333;font-size: .28em;line-height: 1;-webkit-text-size-adjust: none;}
hr {height: .02rem;margin: .1rem 0;border: medium none;border-top: .02rem solid #cacaca;}
a {color: #25a4bb;text-decoration: none;}
```
#### 重置border默认样式

```
@charset "utf-8";
.border,
.border-top,
.border-right,
.border-bottom,
.border-left,
.border-topbottom,
.border-rightleft,
.border-topleft,
.border-rightbottom,
.border-topright,
.border-bottomleft {
    position: relative;
}
.border::before,
.border-top::before,
.border-right::before,
.border-bottom::before,
.border-left::before,
.border-topbottom::before,
.border-topbottom::after,
.border-rightleft::before,
.border-rightleft::after,
.border-topleft::before,
.border-topleft::after,
.border-rightbottom::before,
.border-rightbottom::after,
.border-topright::before,
.border-topright::after,
.border-bottomleft::before,
.border-bottomleft::after {
    content: "\0020";
    overflow: hidden;
    position: absolute;
}
/* border
 * 因，边框是由伪元素区域遮盖在父级
 * 故，子级若有交互，需要对子级设置
 * 定位 及 z轴
 */
.border::before {
    box-sizing: border-box;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    border: 1px solid #eaeaea;
    transform-origin: 0 0;
}
.border-top::before,
.border-bottom::before,
.border-topbottom::before,
.border-topbottom::after,
.border-topleft::before,
.border-rightbottom::after,
.border-topright::before,
.border-bottomleft::before {
    left: 0;
    width: 100%;
    height: 1px;
}
.border-right::before,
.border-left::before,
.border-rightleft::before,
.border-rightleft::after,
.border-topleft::after,
.border-rightbottom::before,
.border-topright::after,
.border-bottomleft::after {
    top: 0;
    width: 1px;
    height: 100%;
}
.border-top::before,
.border-topbottom::before,
.border-topleft::before,
.border-topright::before {
    border-top: 1px solid #eaeaea;
    transform-origin: 0 0;
}
.border-right::before,
.border-rightbottom::before,
.border-rightleft::before,
.border-topright::after {
    border-right: 1px solid #eaeaea;
    transform-origin: 100% 0;
}
.border-bottom::before,
.border-topbottom::after,
.border-rightbottom::after,
.border-bottomleft::before {
    border-bottom: 1px solid #eaeaea;
    transform-origin: 0 100%;
}
.border-left::before,
.border-topleft::after,
.border-rightleft::after,
.border-bottomleft::after {
    border-left: 1px solid #eaeaea;
    transform-origin: 0 0;
}
.border-top::before,
.border-topbottom::before,
.border-topleft::before,
.border-topright::before {
    top: 0;
}
.border-right::before,
.border-rightleft::after,
.border-rightbottom::before,
.border-topright::after {
    right: 0;
}
.border-bottom::before,
.border-topbottom::after,
.border-rightbottom::after,
.border-bottomleft::after {
    bottom: 0;
}
.border-left::before,
.border-rightleft::before,
.border-topleft::after,
.border-bottomleft::before {
    left: 0;
}
@media (max--moz-device-pixel-ratio: 1.49), (-webkit-max-device-pixel-ratio: 1.49), (max-device-pixel-ratio: 1.49), (max-resolution: 143dpi), (max-resolution: 1.49dppx) {
    /* 默认值，无需重置 */
}
@media (min--moz-device-pixel-ratio: 1.5) and (max--moz-device-pixel-ratio: 2.49), (-webkit-min-device-pixel-ratio: 1.5) and (-webkit-max-device-pixel-ratio: 2.49), (min-device-pixel-ratio: 1.5) and (max-device-pixel-ratio: 2.49), (min-resolution: 144dpi) and (max-resolution: 239dpi), (min-resolution: 1.5dppx) and (max-resolution: 2.49dppx) {
    .border::before {
        width: 200%;
        height: 200%;
        transform: scale(.5);
    }
    .border-top::before,
    .border-bottom::before,
    .border-topbottom::before,
    .border-topbottom::after,
    .border-topleft::before,
    .border-rightbottom::after,
    .border-topright::before,
    .border-bottomleft::before {
        transform: scaleY(.5);
    }
    .border-right::before,
    .border-left::before,
    .border-rightleft::before,
    .border-rightleft::after,
    .border-topleft::after,
    .border-rightbottom::before,
    .border-topright::after,
    .border-bottomleft::after {
        transform: scaleX(.5);
    }
}
@media (min--moz-device-pixel-ratio: 2.5), (-webkit-min-device-pixel-ratio: 2.5), (min-device-pixel-ratio: 2.5), (min-resolution: 240dpi), (min-resolution: 2.5dppx) {
    .border::before {
        width: 300%;
        height: 300%;
        transform: scale(.33333);
    }
    .border-top::before,
    .border-bottom::before,
    .border-topbottom::before,
    .border-topbottom::after,
    .border-topleft::before,
    .border-rightbottom::after,
    .border-topright::before,
    .border-bottomleft::before {
        transform: scaleY(.33333);
    }
    .border-right::before,
    .border-left::before,
    .border-rightleft::before,
    .border-rightleft::after,
    .border-topleft::after,
    .border-rightbottom::before,
    .border-topright::after,
    .border-bottomleft::after {
        transform: scaleX(.33333);
    }
}
```
#### 常用JS


##### 函数节流和函数防抖
- 做的事情（把js代码的执行次数控制在合理的范围。既能节省浏览器CPU资源，又能让页面浏览更加顺畅，不会因为js的执行而发生卡顿。）
##### 函数节流
- 指一定时间内js方法只跑一次。比如人的眨眼睛，就是一定时间内眨一次。

```
var canRun = true;
document.getElementById("throttle").onscroll = function(){
    if(!canRun){
        // 判断是否已空闲，如果在执行中，则直接return
        return;
    }
    canRun = false;
    setTimeout(function(){
        console.log("函数节流");
        canRun = true;
    }, 300);
};
// 解析要点
函数节流的要点是，声明一个变量当标志位，记录当前代码是否在执行。
 如果空闲，则可以正常触发方法执行。
 如果代码正在执行，则取消这次方法执行，直接return。

 这个方法的作用是监听ID为throttle元素的滚动事件。
 当canRun为true，则代表现在的滚动处理事件是空闲的，可以使用。
 通过关卡if(!canRun)，等于就拿到了通行证。然后下一步的操作就是立马将关卡关上canRun=false。这样，其他请求执行滚动事件的方法，就被挡回去了。
 接着用setTimeout规定最小的时间间隔300，接着再执行setTimeout方法体里面的内容。
 最后，等setTimeout里面的方法都执行完毕，才释放关卡canRun=true，允许下一个访问者进来。
```


##### 函数抖动
- 指频繁触发的情况下，只有足够的空闲时间，才执行代码一次。比如生活中的坐公交，就是一定时间内，如果有人陆续刷卡上车，司机就不会开车。只有别人没刷卡了，司机才开车。

- 最常见的就是用户注册时候的手机号码验证和邮箱验证了。只有等用户输入完毕后，前端才需要检查格式是否正确，如果不正确，再弹出提示语
##### 函数防抖
- 函数防抖的实现重点，就是巧用setTimeout做缓存池，而且可以轻易地清除待执行的代码。
```
var timer = false;
document.getElementById("debounce").onscroll = function(){
clearTimeout(timer); // 清除未执行的代码，重置回初始化状态

timer = setTimeout(function(){
    console.log("函数防抖");
    }, 300);
};  
// 去抖

function debounce(func, delay) {
    var timeout;
    return function(e) {
        console.log("清除",timeout,e.target.value)
        clearTimeout(timeout);
        var context = this, args = arguments
        console.log("新的",timeout, e.target.value)
        timeout = setTimeout(function(){
            console.log("----")
            func.apply(context, args);
        },delay)
    };
};
var validate = debounce(function(e) {
console.log("change", e.target.value, new Date-0)
}, 380);
```

####  绑定监听
```
document.querySelector("input").addEventListener('input', validate);
```
#### IE与标准浏览器之间的样式 hack
```
.bb{
    background-color:red;/*所有识别*/
    background-color:#00deff\9; /*IE6、7、8识别*/
    +background-color:#a200ff;/*IE6、7识别*/
    _background-color:#1e0bd1;/*IE6识别*/
}
```
#### 清除浮动
```
.clearfix:after{
    content: "020"; 
    display: block; 
    height: 0; 
    clear: both; 
    visibility: hidden;  
}
.clear{
    *zoom:1
}
```
解析原理：
- display:block 使生成的元素以块级元素显示,占满剩余空间;
- height:0 避免生成内容破坏原有布局的高度。
- visibility:hidden 使生成的内容不可见，并允许可能被生成内容盖住的内容可以进行点击和交互;
- 通过 content:"."生成内容作为最后一个元素，至于content里面是点还是其他都是可以的， 例如oocss里面就有经典的 content:".",有些版本可能content 里面内容为空,不推荐这样做, firefox直到7.0 content:”" 仍然会产生额外的空隙
- zoom：1 触发IE hasLayout。

#### 修改chrome记住密码后自动填充表单的黄色背景
```
input:-webkit-autofill, textarea:-webkit-autofill, select:-webkit-autofill {
background-color: rgb(250, 255, 189); /* #FAFFBD; */
background-image: none;
color: rgb(0, 0, 0);
}
```
#### 将浮点数点左边的数每三位添加一个逗号，如12000000.11转化为『12,000,000.11
```
function commafy(num){
    return num && num
    .toString()
    .replace(/(\d)(?=(\d{3})+\.)/g, function($1, $2){
    return $2 + ',';
    });
}
```
#### 实现数组的随机排序
```
var arr = [1,2,3,4,5,6,7,8,9,10];
arr.sort(function(){
    return Math.random() - 0.5;
})
console.log(arr);
```
#### 字符串截断
```
/*
* target: 需要截断字符串
* length: 希望字符串被阶段后的长度
* truncation: 可选，代替所截断多余字符的字符
*/
function truncate(target,length,truncation){
    length=length || 30;
    truncation=truncation===void(0)?'...':truncation;
    return t.length>length ? t.slice(0,length-truncation.length)+truncation : String(t);
}
```
#### 字符串 trim--用于去除字符串两端的空白字符（直到遇到第一个非空白字符串为止它会清除包括换行符、空格、制表符等常见的空白字符。）

```
简单好记版本
function trim(str) {
    return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}
```

```
// 速度超快版本(其实还有比这个更快的)
// 前面的空格用正则，后面的用字符串原生方法
function trim(str) {
    str=str.replace(/^\s+/, '');
    var len=str.length-1;
    for(var i=len; i>=0; i--) {
    if(/\S/.test(str.charAt(i))) {
        str=str.substring(0, i+1);
        break;
        }
    }
        return str;
}
```


#### 表单验证改进系列

三种表单验证模式--传统模式、策略设计模式、ES6的Proxy代理模式
```
let html=`<form action="a.php" id="registerForm" method="post">
<div class="form-group">
    <label for="user">请输入用户名:</label>
    <input type="text" class="form-control" id="user" name="userName">
</div>
<div class="form-group">
    <label for="pwd">请输入密码:</label>
    <input type="password" class="form-control" id="pwd" name="passWord">
</div>
<div class="form-group">
    <label for="phone">请输入手机号码:</label>
    <input type="tel" class="form-control" id="phone" name="phoneNumber">
</div>
<div class="form-group">
    <label for="email">请输入邮箱:</label>
    <input type="text" class="form-control" id="email" name="emailAddress">
</div>
<input type="submit" value='提交'>
</form>`
```
##### 表单传统方式
```
let registerForm = document.querySelector('#registerForm')
registerForm.addEventListener('submit', function() {
if (registerForm.userName.value === '') {
    alert('用户名不能为空！')
    return false
}
if (registerForm.userName.length < 6) {
    alert('用户名长度不能少于6位！')
    return false
}
if (registerForm.passWord.value === '') {
    alert('密码不能为空！')
    return false
}
if (registerForm.passWord.value.length < 6) {
    alert('密码长度不能少于6位！')
    return false
}
if (registerForm.phoneNumber.value === '') {
    alert('手机号码不能为空！')
    return false
}
if (!/^1(3|5|7|8|9)[0-9]{9}$/.test(registerForm.phoneNumber.value)) {
    alert('手机号码格式不正确！')
    return false
}
if (registerForm.emailAddress.value === '') {
    alert('邮箱地址不能为空！')
    return false
}
if (!/^\w+([+-.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
    $/.test(registerForm.emailAddress.value)) {
        alert('邮箱地址格式不正确！')
        return false
    }
}, false)
```
// 优缺点：代码易于理解，但复用性不好，较多的if...else 业务判断
##### 策略设计模式
```
window.onload = ()=>{
let registerForm = document.querySelector('#registerForm')
const strategies = {
    isNonEmpty(value, errorMsg){
        return value === '' ? errorMsg : void 0
    },
    minLength(value, length, errorMsg) {
        return value.length < length ? errorMsg : void 0
    },
    isMoblie(value, errorMsg) {
        return !/^1(3|5|7|8|9)[0-9]{9}$/.test(value) ? errorMsg : void 0
    },
    isEmail(value, errorMsg) {
        return !/^\w+([+-.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value) ? errorMsg : void 0
    }
}
class Validator {
    constructor() {
        this.cache = [] //保存校验规则
    }
    add(dom, rules) {
        for (let rule of rules) {
            let strategyAry = rule.strategy.split(':') //例如['minLength',6]
            let errorMsg = rule.errorMsg //'用户名不能为空'
            this.cache.push(() => {
                let strategy = strategyAry.shift() //用户挑选的strategy
                strategyAry.unshift(dom.value) //把input的value添加进参数列表
                strategyAry.push(errorMsg) //把errorMsg添加进参数列表，[dom.value,6,errorMsg]
                return strategies[strategy].apply(dom, strategyAry)
            })
        }
    }
    start() {
        for (let validatorFunc of this.cache) {
            let errorMsg = validatorFunc()//开始校验，并取得校验后的返回信息
            if (errorMsg) {//r如果有确切返回值，说明校验没有通过
                return errorMsg
            }
        }
    }
}
const validatorFunc = () => {
let validator = new Validator()

validator.add(registerForm.userName, [{
    strategy: 'isNonEmpty',
    errorMsg: '用户名不能为空！'
    }, {
    strategy: 'minLength:6',
    errorMsg: '用户名长度不能小于6位！'
}])

validator.add(registerForm.passWord, [{
    strategy: 'isNonEmpty',
    errorMsg: '密码不能为空！'
    }, {
    strategy: 'minLength:6',
    errorMsg: '密码长度不能小于6位！'
}])

validator.add(registerForm.phoneNumber, [{
    strategy: 'isNonEmpty',
    errorMsg: '手机号码不能为空！'
    }, {
    strategy: 'isMoblie',
    errorMsg: '手机号码格式不正确！'
}])

validator.add(registerForm.emailAddress, [{
    strategy: 'isNonEmpty',
    errorMsg: '邮箱地址不能为空！'
    }, {
    strategy: 'isEmail',
    errorMsg: '邮箱地址格式不正确！'
}])
let errorMsg = validator.start()
    return errorMsg
}


registerForm.addEventListener('submit', function(e) {
let errorMsg = validatorFunc()
if (errorMsg) {
    // 注意，这里写 `return false;` 或者 `retirn;` 都是没什么卵用的，
    // 阻止表单默认提交动作，必须使用 preventDefault
        e.preventDefault()
        alert(errorMsg)
        }
    })
}
```
// 优缺点：利用组合、委托和多态等技术思想，易于扩展、复用性好，缺点就是代码量比第一种稍多

##### Proxy代理模式
```
window.onload = ()=>{
let validator = (target, validator, errorMsg)=> {
return new Proxy(target, {
    _validator: validator,
    set(target, key, value, proxy) {
    if(value === '') {
        alert(`${errorMsg[key]}不能为空！`)
        return target[key] = false
    }
    let va = this._validator[key]
    if(!!va(value)) {
        return Reflect.set(target, key, value, proxy)
    } else {
        alert(`${errorMsg[key]}格式不正确`)
        return target[key] = false
    }
    }
})
}

const validators = {
name(value) {
    return value.length > 6
},
password(value) {
    return value.length > 6
},
mobile(value) {
    return /^1(3|5|7|8|9)[0-9]{9}$/.test(value)
},
email(value) {
    return /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(value)
}
}

const errorMsg = { name: '用户名', password: '密码', mobile: '手机号码', email: '邮箱地址' }
const vali = validator({}, validators, errorMsg)
let registerForm = document.querySelector('#registerForm')
    registerForm.addEventListener('submit', (e)=>{
        let validatorNext = function* (){
            yield vali.name = registerForm.userName.value
            yield vali.password = registerForm.passWord.value
            yield vali.mobile = registerForm.phoneNumber.value
            yield vali.email = registerForm.emailAddress.value
        }

        let validator = validatorNext()
        validator.next()
        let s = vali.name && validator.next() //上一步的校验通过才执行下一步
        s = s ? vali.password && validator.next() : s
        s = s ? vali.mobile && validator.next() : s
        s = s ? vali.email && validator.next() : s
        !s && e.preventDefault()
    })
}
```
// 优缺点：条件和对象本身完全隔离开,后续代码的维护,代码整洁度,以及代码健壮性和复用性变得非常强，缺点是兼容性不好，但可以通过使用Babel来进行代码转换

#### 获取滚动条距离顶部的距离
```
const getScrollTop = () => {
    return document.documentElement.scrollTop || document.body.scrollTop
}
```
#### 获取当前可视范围的高度
```
const getClientHeight = () => {
    let clientHeight = 0
    if (document.body.clientHeight && document.documentElement.clientHeight) {
    clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight)
    } else {
    clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight)
    }
    return clientHeight
}
```
#### 获取文档完整的高度，包括超出屏幕可以滚动显示的部分
```
const getScrollHeight = () => {
    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight)
}
```
#### 移动端浮层滚动的同时阻止背后 document的整个滚动(重点使用频率高，很高)
```
/* CSS */
.noscroll, .noscroll body {
    overflow:hidden;
}
.noscroll body {
    position: relative;
}

// 关键 JS代码, 非原生JS，基于 zepto 或者 jQuery实现
$.smartScroll = function(container, selectorScrollable) {
// 如果没有滚动容器选择器，或者已经绑定了滚动事件，忽略
if (!selectorScrollable || container.data('isBindScroll')) {
    return;
}

// 是否是浏览器
// 自己在这里添加判断和筛选
var isSBBrowser;
var data = {
    posY: 0,
    maxscroll: 0
};
// 事件处理
container.on({
    touchstart: function (event) {
        var events = event.touches[0] || event;
        
        // 先求得是不是滚动元素或者滚动元素的子元素
        var elTarget = $(event.target);
        
        if (!elTarget.length) {
            return;    
        }
        
        var elScroll;
        
        // 获取标记的滚动元素，自身或子元素皆可
        if (elTarget.is(selectorScrollable)) {
            elScroll = elTarget;
        } else if ((elScroll = elTarget.parents(selectorScrollable)).length == 0) {
            elScroll = null;
        }
        
        if (!elScroll) {
            return;
        }
        
        // 当前滚动元素标记
        data.elScroll = elScroll;
        
        // 垂直位置标记
        data.posY = events.pageY;
        data.scrollY = elScroll.scrollTop();
        // 是否可以滚动
        data.maxscroll = elScroll[0].scrollHeight - elScroll[0].clientHeight;
    },
    touchmove: function () {
        // 如果不足于滚动，则禁止触发整个窗体元素的滚动
        if (data.maxscroll <= 0 || isSBBrowser) {
            // 禁止滚动
            event.preventDefault();
        }
        // 滚动元素
        var elScroll = data.elScroll;
        // 当前的滚动高度
        var scrollTop = elScroll.scrollTop();

        // 现在移动的垂直位置，用来判断是往上移动还是往下
        var events = event.touches[0] || event;
        // 移动距离
        var distanceY = events.pageY - data.posY;

        if (isSBBrowser) {
            elScroll.scrollTop(data.scrollY - distanceY);
            elScroll.trigger('scroll');
            return;
        }

        // 上下边缘检测
        if (distanceY > 0 && scrollTop == 0) {
            // 往上滑，并且到头
            // 禁止滚动的默认行为
            event.preventDefault();
            return;
        }

        // 下边缘检测
        if (distanceY < 0 && (scrollTop + 1 >= data.maxscroll)) {
            // 往下滑，并且到头
            // 禁止滚动的默认行为
            event.preventDefault();
            return;
        }
    },
    touchend: function () {
        data.maxscroll = 0;
    }    
});

// 防止多次重复绑定
container.data('isBindScroll', true);
};
```
#### 自定义滚动条相关的七个伪元素
```
::-webkit-scrollbar：整个滚动条
::-webkit-scrollbar-button：滚动条上的按钮（下下箭头）
::-webkit-scrollbar-thumb：滚动条上的滚动滑块
::-webkit-scrollbar-track：滚动条轨道
::-webkit-scrollbar-track-piece：滚动条没有滑块的轨道部分
::-webkit-scrollbar-corner：当同时有垂直和水平滚动条时交汇的部分
::-webkit-resizer：某些元素的交汇部分的部分样式（类似 textarea的可拖动按钮）
```
#### 16进制颜色代码生成
```
function createColor() {
    return '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6)
}
```

#### 驼峰命名转下划线
```
function camel2Underline(name) {
    return name.match(/[a-z][0-9]+|[A-Z][a-z0-9]*/g).join('_').toLowerCase()
}
```
####  日期格式化
- 版本1
```
function format1(x, y) {
    var z = {
    y: x.getFullYear(),
    M: x.getMonth() + 1,
    d: x.getDate(),
    h: x.getHours(),
    m: x.getMinutes(),
    s: x.getSeconds()
    }
    return y.replace(/(y+|M+|d+|h+|m+|s+)/g, function(v) {
    return ((v.length > 1 ? '0' : '') + z[v.slice(-1)]).slice(-(v.length > 2 ? v.length : 2))
    })
}
```
- 版本2
```
Date.prototype.format2 = function(fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    }
    if (/(y+)/.test(fmt)) {
        // 这里 RegExp的用法挺有意思的
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length))
    }
    for (var k in o) {
        if (new RegExp('(' + k + ')').test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? o[k] : ('00' + o[k]).substr(('' + o[k]).length))
        }
    }
    return fmt
}
```
- 使用
```
format1(new Date(), 'yy-MM-dd hh:m:ss')  // 18-08-23 11:46:11
new Date().format2('yyyy-M-d h:m:s')  // 2018-8-23 11:46:11
```
#### 数字四舍五入
```
// v: 值， p: 精度
function round(v, p) {
    p = Math.pow(10, p >>> 31 ? 0 : p | 0)
    v *= p
    return (v + 0.5 + (v >> 31) | 0) / p
}
// 使用
round(123.456788, 2)  // 123.46
```
#### 浏览器原生 Base64编码和解码方法
    ```
        支持度为 IE10+，其他主流浏览器完全支持

        编码(btoa):

        window.btoa(stringToEncode)
        解码(atob)：

        // encodedData 代表 base64字符串
        window.atob(encodedData)
        对中文进行编码会报错，可以先将中文转码，再进行编码，解码同样如此：

        window.btoa(window.encodeURIComponent('嘻嘻哈哈'))
        window.atob(window.decodeURIComponent('JUU1JTk4JUJCJUU1JTk4JUJCJUU1JTkzJTg4JUU1JTkzJTg4'))
        如果 IE9-浏览器需要此功能，可使用 polyfill， 然后像下面这样引入即可：

        <!--[if IE]>
        <script src="./base64-polyfill.js"></script>
        <![endif]-->
        任意文件也可以使用此 api进行编码和解码，使用 FileReader:

        var reader = new FileReader();
        reader.onload = function(e) {
            // e.target.result就是该文件的完整Base64 Data-URI
        };
        reader.readAsDataURL(file);
    ```

#### 利用委托冒泡，检测ul下被点击的li标签
```
    window.onload = function(){
        var oUl = document.getElementById("ul");
        var aLi = oUl.getElementsByTagName("li");
        oUl.onclick = function(ev){ 
        var ev = ev || window.event;
        var target = ev.target || ev.srcElement;
            if(target.nodeName.toLowerCase() == "li"){
            var that=target;
            var index;
            for(var i=0;i<aLi.length;i++){
                if(aLi[i]===target){
                index=i;
                }
            }
            if(index>=0){
                alert('我的下标是：'+index);
            }
            }
        }
    }
```
#### 直接把函数赋值给变量
    - 凡是使用 return 返回函数调用的(也就是回调)，都可以去掉这个间接包裹层，最终连参数和括号一起去掉
    ```
    const getServerStuff = function(callback) {
        return ajaxCall(function(json) {
        return callback(json)
        })
    }

    // 上述代码等价于下面这句：
    const getServerStuff = function(callback) {
        return ajaxCall(callback)
    }
    // 上述代码等价于下面这句：
    const getServerStuff = ajaxCall
    ```
#### 遍历对象
    当使用 for in 循环遍历对象的属性时，原型链上的所有属性都将被访问，同时如果遍历的是数组，
    遍历顺序有可能不是按照实际数组的内部顺序，因此如果遍历数组，尽可能使用传统的 for 循环

#### hasOwnProperty
    当检查对象上某个属性是否存在时，hasOwnProperty 是唯一可用的方法。 同时在使用 for in遍历对象时，
    推荐总是使用 hasOwnProperty 方法，这将会避免原型对象扩展带来的干扰。

#### 创建数组
    应该尽量避免使用数组构造函数创建新数组。推荐使用数组的字面语法。它们更加短小和简洁，因此增加了代码的可读性。

#### 检测对象的类型
    为了检测一个对象的类型，强烈推荐使用 Object.prototype.toString 方法； 因为这是唯一一个可依赖的方式。

#### instanceof
    instanceof 操作符应该仅仅用来比较来自同一个 JavaScript 上下文的自定义对象。
     正如 typeof 操作符一样，任何其它的用法都应该是避免的。

#### 手工清空定时器
    ```
    // 每个setTimeout 都会返回一个 ID 标识
    var id = setTimeout(foo, 1000);
    clearTimeout(id);
    
    // 清空"所有"的定时器
    for(var i = 1; i < 1000; i++) {
        clearTimeout(i);
    }
    ```
#### 优化选择器
    ```
    选择器以 ID 开始总是最好的。
    //  快
    $('#container div.robotarm');

    // 非常快
    $('#container').find('div.robotarm');

    // 使用 $.fn.find 的方式会更快是因为在第一步里只有 ID，
     根本没用到快速选择器引擎，而是使用了浏览器内置的极速的 document.getElementById()。
    选择器的右侧部分应该尽可能具体，左侧则不需要那么具体
    //未优化的
    $('div.data .gonzalez');

    // 优化过的
    $('.data td.gonzalez');
    避免使用无定向选择器
    $('.buttons > *');  // 极慢
    $('.buttons').children();  // 快很多

    $('.gender :radio');  // 暗示这是一个无定向的搜索
    $('.gender *:radio'); // 同上，这只不过是说出来了
    $('.gender input:radio'); // 这就差不多了
    ```
#### 使用事件委派
    ```
    // 如果列表里面元素很多，不堪想象
    $('li.trigger').click(handlerFn);

    // 这样写好一点，用 $.fn.live 做事件委派
    $('li.trigger').live('click', handlerFn);

    // 最好的做法，用 $.fn.delegate 做事件委派，还可以指定一个上下文
    $('#myList').delegate('li.trigger', 'click', handlerFn);
    // 先将元素 detach 出来再操作
    // DOM 操作是慢的，你应该尽量避免去操作它。 
    jQuery 在 1.4 版引入了 $.fn.detach 来帮助解决这个问题：让你可以先将元素从 DOM 树中剥离出来再进行操作。

    var $table = $('#myTable');
    var $parent = $table.parent();

    $table.detach();
    // ... 添加大量的行到表格中去
    $parent.append(table);
    应该使用样式表给大量元素修改 CSS
    如果你在用 $.fn.css 给多于 20 个元素修改 CSS，考虑一下添加一个 style 标签，
     这样可以速度可以提升 60%。 操作大于 20 个元素是不错的，但少于时就不值了

    // 少量css操作
    $('a.swedberg').css('color', '#asd123');
    // 大量css操作，最好使用样式表
    $('<style type="text/css">a.swedberg { color : #asd123 }</style>').appendTo('head');
    使用 $.data 而不是 $.fn.data
    // 常规写法
    $(elem).data(key,value);

    // 快 10 倍
    $.data(elem,key,value);
    别费时间在空白的选择结果上了
    // 太糟了，执行了三个方法后才意识到里面是空的
    $('#nosuchthing').slideUp();

    // 这会好点，就是代码有点长
    var $mySelection = $('#nosuchthing');
    if ($mySelection.length) { mySelection.slideUp(); }

    // 最好的做法是添加一个 doOnce 插件
    jQuery.fn.doOnce = function(func){ 
        this.length && func.apply(this);
        return this; 
    }

    $('li.cartitems').doOnce(function(){ 
        // make it ajax! \o/
    });
    ```
#### 判定 IE7-
    // 其中 'p'[0]，`p`可以换成任何单字符，如果原样返回这个字符，则说明是 IE8+，
    否则返回 undefined 则表明是 IE7-
    ```
    if('p'[0]){
        console.log("It\'s IE8+");
    } else {
        console.log("It\'s IE7-");
    }
    ```
#### 处理大量的数据
    将数据的数据量很大，一次性处理这些数据所需花费的时间较长，并且可能导致诸如浏览器暂时失去响应的结果，
     那么最好将这些数据分割成数个小的 “进程”，利用事件轮询来取得一个更加流畅的效果。

    使用 setTimeout（黑科技）来异步排程，基本上它的意思是“将这个函数贴在事件轮询队列的末尾”。

    下面这些是一般处理数据的方法，当数据量很大时，可能导致浏览器失去响应：
    ```
    var res = [];

    // `response(..)`从Ajax调用收到一个结果数组
    function response(data) {
        // 连接到既存的`res`数组上
        res = res.concat(
            // 制造一个新的变形过的数组，所有的`data`值都翻倍
            data.map( function(val){
                return val * 2;
            } )
        );
    }

    // ajax(..) 是某个包中任意的Ajax函数
    ajax( "http://some.url.1", response );
    ajax( "http://some.url.2", response );
    最好使用以下写法，利用 setTimeout 来将处理数据的过程，分割成数个小的“进程”：

    var res = [];

    // `response(..)`从Ajax调用收到一个结果数组
    function response(data) {
        // 我们一次只处理1000件
        var chunk = data.splice( 0, 1000 );

        // 连接到既存的`res`数组上
        res = res.concat(
            // 制造一个新的变形过的数组，所有的`data`值都翻倍
            chunk.map( function(val){
                return val * 2;
            } )
        );

        // 还有东西要处理吗？
        if (data.length > 0) {
            // 异步规划下一个批处理，将剩余的数据追加到下一个事件轮询队列中
            setTimeout( function(){
                response( data );
            }, 0);
        }
    }

    // ajax(..) 是某个包中任意的Ajax函数
    ajax( "http://some.url.1", response );
    ajax( "http://some.url.2", response );
    ```
#### 字符输出
    
    HTML中字符输出使用&#x配上 charCode值；
    在JavaScript文件中为防止乱码转义，则是 \u配上 charCode值；
    而在 CSS文件中，如 CSS伪元素的 content属性，直接使用 \配上 charCode值。
    因此，想在 HTML/JS/CSS中转义“我”这个汉字，分别是：

    &#x6211;
    \u6211, 如console.log('\u6211')
    \6211, 如.xxx:before { content: '\6211'; }
    使用 js获取字符 charCode方法：

    // 例如获取 `好`的 charCode
    '你好'.charCodeAt(1).toString(16)
    考虑到直接 &#x3000;这种形式暴露在HTML中，可能会让屏幕阅读器等辅助设备读取，从而影响正常阅读流，
    因此， 我们可以进一步优化下，使用标签，利用伪元素，例如：

    .full:before { content: '\2003'; speak: none; }
    这样，占位的空格字符即不能读，也不能选了。
  
#### CSS中层叠上下文顺序
##### 由上到下，层次依次递减
    ```
    // 正z-index
    // z-index:auto / z-index:0 / 不依赖 z-index的层叠上下文
    // inline/inline-block水平盒子
    // float浮动盒子
    // block块状水平盒子
    // 负z-index
    // 层叠上下文background / border
    // 异常捕获
    // try...catch
    // 使用try catch能够很好的捕获异常并对应进行相应处理，不至于让页面挂掉，但是其存在一些弊端，
    比如需要在捕获异常的代码上进行包裹，会导致页面臃肿不堪，不适用于整个项目的异常捕获。



    window.onerror
    window.onerror提供了全局监听异常的功能，不过可能会存在以下问题：

    Script error window.onerror无法准确捕获到跨域资源的异常信息，例如 CDN上的静态资源，
    只会统一返回 Script error 解决方案： script标签配置 crossorigin="anonymous"
     并且服务器添加 Access-Control-Allow-Origin: *(一般 CDN服务器都会配置此属性):
    //<script src="http://cdn.xxx.com/index.js" crossorigin="anonymous">
    sourceMap
    线上代码一般是混淆压缩的，无法正确清晰地定位报错代码的位置，所以需要启用 sourceMap，例如，在 webpack打包工具中启用：

    module.exports = {
        // ...
        devtool: '#source-map',
        // ...
    }

    MVVM框架中的异常捕获
    一般的 MVVM框架自带异常捕获机制，并且通常会屏蔽外部添加的异常捕获代码，例如 window.onerror。

    下面是 vue2.x中捕获全局异常的方法：

    Vue.config.errorHandler = function (err, vm, info) {
        let { 
            message, // 异常信息
            name, // 异常名称
            script,  // 异常脚本url
            line,  // 异常行号
            column,  // 异常列号
            stack  // 异常堆栈信息
        } = err;
        
        // vm为抛出异常的 Vue 实例
        // info为 Vue 特定的错误信息，比如错误所在的生命周期钩子
        // 只在 2.2.0+ 可用
    }
    ```
#### 异常上报
    捕获到异常后，需要进行上报，这一步比较简单，例如直接将捕获到的错误通过 ajax全部上传即可。

    sourceMap 异常解析
    上传的错误日志可能是混淆加密后的代码的错误日志，不好分析，
    所以还需要使用 soureMap分析工具对其进行解析。 这样的工具，例如 source-map

#### 深度判等
    - 两个对象结构和数据完全一致，即认为相等，而不要求是同一引用
    ```
    export function deepEqual (o1, o2) {
        if (typeof o1 !== 'object' || typeof o2 !== 'object') { return o1 === o2 }
        // 完全遍历 o1,保证 o2 的数据结构可以覆盖 o1的，也就是说 o2的数据结构大于等于 o1的
        for (var p in o1) {
        if (!deepEqual(o1[p], o2[p])) { return false }
        }
        // 保证 o2中存在的数据结构在 o1中也存在，结合上一步，即可证明二者数据结构完全一致
        for (var q in o2) {
        if (!(q in o1)) { return false }
        }
        return true	
    }
    ```
#### 深度覆盖
    - 将源对象的值覆盖目标对象，相同结构相同参数部分直接覆盖，其它部分保持不变，例如： 修改前：
    ```
    target = {x: 1, y: {a: 1, b:1 }, z: 1};
    source = {x: 2, y: {a: 2}};
    修改后：

    target = {x: 2, y: {a: 2, b:1 }, z: 1}
    实现：

    function deepAssign (target, ...sources) {
        if (typeof target !== 'object') {
        console.error('[deepAssign] bad parameters, target should be an object, parameters:', arguments)
        return target
        }

        for (let source of sources) {
        if (source != null && typeof source !== 'object') {
            console.warn('[deepAssign] bad parameters, source should all be object, parameters:', arguments)
            continue
        }

        for (var p in source) {
            if (typeof target[p] === 'object' && typeof source[p] === 'object') { deepAssign(target[p], source[p]) }
            else { target[p] = source[p] }
        }
        }

        return target
    }
    ```
#### 监控网页的崩溃
由于网页崩溃以后，页面上的 js很可能也是无法运行的了，所以无法使用页面上的 js进行网页崩溃的监控，需要另寻他法。
1.https://mp.weixin.qq.com/s/HnMZLI7hZ5sXU7bOXh615A
2.https://zhuanlan.zhihu.com/p/40273861

#### 解决堆栈
##### 堆栈溢出一般是由什么原因导致？

- 1.没有回收垃圾资源

- 2.层次太深的递归调用
```
const nextListItem = () => {
    // 假设 list是一个已经存在的数组
    if (list.pop()) {
    nextListItem();
    }
}
```
上述代码在 list数组长度较大的时候，由于可能会不断地进行回调自身的操作，不断在申请内存用于存放堆栈信息，
一直到函数达到一定条件不再进行持续的回调自身，最初的函数才运行结束，释放掉所申请的所有内存，
而如果在此期间所申请的总内存超出了线程的栈空间，则将发生栈溢出。

有两种解决方式：

异步
```
const nextListItem = () => {
    if (list.pop()) {
    setTimeout(nextListItem, 0)
    }
}
setTimeout的作用就是让代码异步运行，将每次回调自身函数的执行放到事件队列中，
上一个函数执行完就可以退出，释放所占用的内存，不会造成内存累计的情况。
```
闭包
```
const nextListItem = () => {
    if (list.pop()) {
    return function() {
        return nextListItem()
    }
    }
}
// 为了避免不断调用，例如 nextListItem()()()，增加一个自动调用器
const autoRun = func => {
    const value = func()
    typeof value === 'function' && autoRun(value)
}
// 使用
autoRun(nextListItem)
闭包返回的是一个新函数，之前的函数在运行结束后可以释放内存，所以也不存在内存堆积的情况。
```
