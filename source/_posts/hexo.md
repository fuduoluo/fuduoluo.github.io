---
title: Hexo问题汇总
permalink: 'posts/:abbrlink.html'
top_img: https://i.loli.net/2020/03/22/gJEfsq5SzKaptj6.png
copyright: true
categories: Hexo
tags: Hexo
abbrlink: cded68c5
date: 2019-07-12 00:27:11
updated: 2019-07-12 00:27:11
subtitle:	
top: true
cover: https://i.loli.net/2020/03/22/gJEfsq5SzKaptj6.png
---

### 升级HEXO和更新Butterfly主题版本
#### 升级hexo

- 在博客根目录下  [D:\blogs] 
- 运行以下代码 Hexo版本升级可以通过npm实现
    {% note primary %}
    全局升级hexo-cli
    {% endnote %}
    ```
    npm i hexo-cli -g
    ```

    {% note primary %}
    npm-check检查更新
    {% endnote %}
    ```
    npm install -g npm-check
    npm-check
    ```

    {% note primary %}
    npm-upgrade更新
    {% endnote %}
    ```
    npm install -g npm-upgrade
    npm-upgrade
    ```

    {% note primary %}
    更新全局包：
    {% endnote %}
    ```
    npm update <name> -g
    ```

    {% note primary %}
    更新生产环境依赖包
    {% endnote %}
    ```
    npm update <name> --save
    ```

#### 升级butterfly主题
{% note success %}

為了主題的平滑升級, Butterfly 使用了 data files特性。
推薦把主題默認的配置文件_config.yml複製到 Hexo 工作目錄下的source/_data/butterfly.yml，如果source/_data的目錄不存在那就創建一個。
注意，如果你創建了butterfly.yml, 它將會替換主題默認配置文件_config.yml裏的配置項 (不是合併而是替換), 之後你就只需要通過git pull的方式就可以平滑地升級 theme-butterfly了。

{% endnote %}
#### 操作如下
{% note success %}
进入主题目录路径  [D:\blogs\themes\Butterfly]
使用 git bash here 工具
使用 git pull 进项拉取新项目
复制_config.yml到Hexo 工作目錄下的source/_data/butterfly.yml进行替换
hexo cl && hexo s 
{% endnote %}

### hexo 发布之后 gitpage 自定义域名失效
- 起因：每次配置 custom domain 之后，再次 hexo deploy 之后，custom domain 会被重置失效。
<!--more-->
#### 方法：在 hexo 生成的博客的 source 目录下新建一个 CNAME 文件，然后在这个文件中填入你的域名，
#### 这样就不会每次发布之后，gitpage 里的 custom domain 都被重置掉啦。

![添加路径](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/hexo/3098875-db6877df60ef748e.png)

#### 使用 gitpage 功能将博客托管在了 github 上，并配置 CNAME 将自己的域名解析了过去，
#### 在 github 的仓库设置中开始 custom domain 的功能，这时候就可以直接使用自己的域名访问啦。

![配置github page域名](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/hexo/3098875-c40da031137a0c4f.png)


