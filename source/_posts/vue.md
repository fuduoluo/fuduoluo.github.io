---
title:  Vue Cli 3.* + TP5 前后端分离访问(未跨域)
permalink: 'posts/:abbrlink.html'
copyright: true
categories: vue
tags: vue 
abbrlink: c0add594
subtitle: Vue Cli 3.* + TP5
date: 2019-07-11 21:03:56
updated: 2019-07-11 21:03:56
cover: https://cdn.jsdelivr.net/npm/@bootcss/www.bootcss.com@0.0.3/dist/img/vuejs.png
---
>作为新手，坑是少不了的！下面是我很荣幸跳的坑


##### 目录
![结构目录](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/vuecli3%2Bphp%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB/3098875-a904c86423d30c18.png)

##### 1.Vue Cli3 和Vue  Cli2 区别
```
1.vue-cli 3 的 github 仓库由原有独立的 github 仓库迁移到了 vue 项目下
2.vue-cli 3 的项目架构完全抛弃了 vue-cli 2 的原有架构，3 的设计更加抽象和简洁（此处后续可以详细介绍）
3.vue-cli 3 是基于 webpack 4 打造，vue-cli 2 还是 webapck 3
4.vue-cli 3 的设计原则是“0配置”
5.vue-cli 3 提供了 vue ui 命令，提供了可视化配置，更加人性化
```
###### 以上对我来说有这个东西就行了 我反正也没有深入研究  哈哈哈  毕竟菜！
>由于 vue-cli 3 也学习了 rollup 的零配置思路，所以项目初始化后，没有了以前熟悉的 build 目录，也就没有了 webpack.base.config.js、webpack.dev.config.js 、webpack.prod.config.js 等配置文件。

###### 我还以为一直问怎么就没有了build 我去哪里配置东西  真惭愧！
<!--more-->
##### 2.Vue.Config.js 怎么配置?
[如何配置 vue-cli 3.0 的 vue.config.js](https://segmentfault.com/a/1190000016101954)
[以上链接大佬个人主页](https://segmentfault.com/u/shenyibandenanren)
[vue cli3中文文档](https://cli.vuejs.org/zh/guide/)
[webpack-plugins](https://webpack.js.org/plugins/mini-css-extract-plugin/)
[webpack-chain](https://github.com/neutrinojs/webpack-chain)

##### 附上我自己的配置（因人而异以下有的我都没有真正实践用过！！）


```
/**
	* *@2019-06-28
	* *@author xxx
	* *@describe vue-cli 3.x配置文件
	*/
let ts = Date.parse(new Date());
const path = require('path');
function resolve(dir) {
	return path.join(__dirname, dir);
}
module.exports = {
	// 基本路径
	publicPath: process.env.NODE_ENV === 'production' ? '/' : '/',
	// 用于嵌套生成的静态资产（js,css,img,fonts）目录
	 assetsDir: 'front',
	// 指定生成的 index.html 的输出路径 (相对于 outputDir)。也可以是一个绝对路径
	indexPath: 'index.html', // Default: 'index.html'
	// 输出文件目录
	outputDir: 'dist', // 默认dist
	filenameHashing: true,
	// 构建多页时使用
	pages: undefined,
	// eslint-loader是否在保存的时候检查
	lintOnSave: true,
	// 是否使用包含运行时编译器的Vue核心的构建
	runtimeCompiler: false,
	// 默认情况下 babel-loader 会忽略所有 node_modules 中的文件。如果你想要通过 Babel 显式转译一个依赖，可以在这个选项中列出来
	transpileDependencies: [],
	// 如果你不需要生产环境的 source map，可以将其设置为 false 以加速生产环境构建。
	productionSourceMap: false,
	// 如果这个值是一个对象，则会通过 webpack-merge 合并到最终的配置中。如果这个值是一个函数，则会接收被解析的配置作为参数。该函数及可以修改配置并不返回任何东西，也可以返回一个被克隆或合并过的配置版本。
	configureWebpack: config => {
		if (process.env.NODE_ENV === 'production') {
			console.log(process.env.NODE_ENV);
			// 为生产环境修改配置...
		} else {
			// 为开发环境修改配置...
		}
	},
	// 是一个函数，会接收一个基于 webpack-chain 的 ChainableConfig 实例。允许对内部的 webpack 配置进行更细粒度的修改。
	chainWebpack: (config) => {
		if(process.env.VUE_APP_MODE == 'development'){
			config.plugin('compress')
			.use(FileManagerPlugin, [{
				onEnd: {
					delete: [ //首先需要删除项目根目录下的dist.zip
						'./*.zip',
					],
					archive: [ //然后我们选择dist文件夹将之打包成dist.zip并放在根目录
						{source: './dist', destination: `./biProject-${ts}-production.zip`},
						{source: './beta', destination: `./biProject-${ts}-test.zip`}
					]
				}
			}])
		}	
        // 配置路径别名，你可以自己再加，按这种格式.set('', resolve(''))
		config.resolve.alias
		.set('@', resolve('src'))
		.set('@assets',resolve('src/assets'))

	},
	// css相关配置
	css: {
		// 启用 CSS modules
		modules: false,
		// 是否使用css分离插件
		extract: true,
		// 开启 CSS source maps?
		sourceMap: false,
		// css预设器配置项
		loaderOptions: {},
	},
	// webpack-dev-server 相关配置
	devServer: {
		host: '0.0.0.0',
		port: 8080,
		https: false,
		open: true,
		hotOnly: false,
		// proxy: 'http://localhost:4000' // 配置跨域处理,只有一个代理
		  proxy: {
		    '/api/': {
		      target: '域名',   //代理接口
		      changeOrigin: true,
		      pathRewrite: {
		        '^/api': ''   //代理的路径
		      }
		  }
		},
		// 设置代理
		before: app => {},
	},
	// PWA 插件相关配置
	pwa: {},
	// 第三方插件配置
	pluginOptions: {
		// ...
	}
}
```
##### 3.axios安装使用
```
1.安装
npm install axios ---ajax
npm install qs ---序列化
2.全局使用
同级目录新建文件https.js
在main.js使用以下引入并全局使用
----------不要使用use--------
import https from './https.js'
Vue.prototype.$https=https
```
![https.js main.js](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/vuecli3%2Bphp%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB/3098875-3620afba8fd33c83.png)

```
这边是使用已封装好的axios
----------------------
https.js 内容如下：
具体内容还没有去理解（会用就行，后面再去理解如何封装）
------------------
import axios from 'axios'
import qs from 'qs'

//以下是发生跨域使用--还没有实践
//axios.defaults.timeout = 5000;                        //响应时间
//axios.defaults.headers.common['userKey'] = localStorage.token;
//axios.defaults.headers['Content-Type'] = 'application/x-www-form-urlencoded' //配置请求头
//axios.defaults.baseURL = '域名';   //配置接口地址

//POST传参序列化(添加请求拦截器)
axios.interceptors.request.use((config) => {
	//在发送请求之前做某件事
	if(config.method  === 'post'){
		config.data = qs.stringify(config.data);
	}
	return config;
},(error) =>{
	console.log('错误的传参');
	return Promise.reject(error);
});

//返回状态判断(添加响应拦截器)
axios.interceptors.response.use((res) =>{
	//对响应数据做些事
	if(!res.data.success){
		return Promise.resolve(res);
	}
	return res;
}, (err) => {
	    if (err && err.response) {
	      switch (err.response.status) {
	        case 400:
	            console.log('错误请求')
	          break;
	        case 401:
	            console.log('未授权，请重新登录')
	          break;
	        case 403:
	          console.log('拒绝访问')
	          break;
	        case 404:
	          console.log('请求错误,未找到该资源')
	          break;
	        case 405:
	          console.log('请求方法未允许')
	          break;
	        case 408:
	          console.log('请求超时')
	          break;
	        case 500:
	          console.log('服务器端出错')
	          break;
	        case 501:
	          console.log('网络未实现')
	          break;
	        case 502:
	          console.log('网络错误')
	          break;
	        case 503:
	          console.log('服务不可用')
	          break;
	        case 504:
	          console.log('网络超时')
	          break;
	        case 505:
	          console.log('http版本不支持该请求')
	          break;
	        default:
	          console.log(`连接错误${err.response.status}`)
	      }
	    } else {
	      console.log('连接到服务器失败')
	    }
	    // return Promise.resolve(err.response)
	return Promise.reject(err);
});

//返回一个Promise(发送post请求)
export function fetchPost(url, params) {
	return new Promise((resolve, reject) => {
		axios.post(url, params)
		.then(response => {
			resolve(response);
		}, err => {
			reject(err);
		})
		.catch((error) => {
			reject(error)
		})
	})
}
////返回一个Promise(发送get请求)
export function fetchGet(url, param) {
	return new Promise((resolve, reject) => {
		axios.get(url, {params: param})
		.then(response => {
			resolve(response)
		}, err => {
			reject(err)
		})
		.catch((error) => {
			reject(error)
		})
	})
}
//暴露出口
export default {
	axios,
	fetchPost,
	fetchGet
}

组件使用：
.....
  created (){
    this.loginPost();
  },
  methods: {
      loginPost: function () {
          this.$https.fetchPost("/index.php/index/index",'').then(res => {
              console.log(res);
          }, res => {
              console.info('调用失败');
          })
      }
  },
.......
```
##### 4.Vue和Tp5 共享同一路由
起因：
- 访问www.xxxx.com进入前端页面（vue项目）
- www.xxxx.com/admin.php/login 进入后台登陆界面（Tp5项目）
- 但是因为只有一个域名，所有每一次去访问域名则返回内容是 TP5  -> index方法返回的数据
根本没办法返回数据至前端页面 也打不开vue前端页面

[参考文章](https://www.jianshu.com/p/fec73eaec081)
###### [原理]vue和tp5有自己的路由，但是tp5用来做数据端就不需要这个了，直接设置为vue的nginx配置即可
###### 4.1 nginx伪静态配置：
![nginx伪静态配置](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/vuecli3%2Bphp%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB/3098875-0d77e2b640fcc8c7.png)
```
直接复制：
-------
location / {
  try_files $uri $uri/ /index.html;
}
location ~ ^/(thinkphp|vendor/phpunit|application|runtime)/.*\.php
{
    return 404;
}
```
###### 4.2nginx默认文件配置：
![默认文件配置](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/vuecli3%2Bphp%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB/3098875-e18a02d85391908c.png)
设置优先级
###### 4.3将打包好的vue文件包dist上传到public目录下并解压：
![上传服务器](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/vuecli3%2Bphp%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB/11860463-949e19e810d5b496.webp)
###### 4.3请求接口
```
原本：/api/index/index
      loginPost: function () {
          this.$https.fetchPost("/index.php/index/index",'').then(res => {
              console.log(res);
          }, res => {
              console.info('调用失败');
          })
      }
```
##### 线上测试结果
![返回前端数据](https://upload-images.jianshu.io/upload_images/3098875-e5a1faad4c07a526.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 以上配置后--本地环境与线上环境获取数据
- 本地环境
```
  methods: {
    loginPost: function() {
      this.$https.fetchPost("/api/index.php/index/index", "").then(res => {
          console.log(res.data);
        },
        res => {
          console.info("调用失败");
        }
      );
    },
  }
```
- 线上环境
```
  methods: {
    loginPost: function() {
      this.$https.fetchPost("index.php/index/index", "").then(res => {
          console.log(res.data);
        },
        res => {
          console.info("调用失败");
        }
      );
    },
  }
```