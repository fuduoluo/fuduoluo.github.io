---
title: Git问题汇总
permalink: 'posts/:abbrlink.html'
top_img: （除非特定需要，可以不寫）
comments: true
toc: 'https://i.loli.net/2020/03/22/ycpGbagOj8SCwH3.png'
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: 'https://i.loli.net/2020/03/22/ycpGbagOj8SCwH3.png'
tags: Git
categories: Git
keywords: git's question
description: record something for Git
abbrlink: b9df10c9
date: 2020-04-19 11:04:30
updated: 2020-4-19 11:41:11
---

<blockquote class="blockquote-center">工作中遇到的问题集合</blockquote>


### git pull时出现冲突

>git fetch --all //只是下载代码到本地，不进行合并操作
 git reset --hard origin/master  //把HEAD指向最新下载的版本


### git merge 出现以下错误
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-477e115aad7f2129.png)

>git merge 分支名 --allow-unrelated-histories


### git pull 出现以下错误

{% note danger %}
fatal: refusing to merge unrelated histories
拒绝合并不相关历史
{% endnote %}

>解决：git pull --allow-unrelated-histories



### git clone报错

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-bb5704ee6a442f76.png)

[使用Git clone代码失败的解决方法](https://www.jianshu.com/p/f5295c74ee39)

{% note danger %}
error: RPC failed; curl 56 OpenSSL SSL_read: SSL_ERROR_SYSCALL, errno 10054
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed
{% endnote %}
- 因为Git限制了推送数据的大小导致的错误。
- 解决方法：重新设置通信缓存大小

> git config http.postBuffer 524288000
> git config --global http.postBuffer 524288000

### git clone执行完设置通信缓存大小报错

{% note danger %}
 git config http.sslVerify "false"
 fatal: not in a git directory
{% endnote %}
>  git config --global http.sslVerify false


### git status 分支比主分支提交超前

{% note danger %}
git Your branch is ahead of 'gitee/master' by 1 commit.
[git您的分支比“ gitee / master”提前1次提交。]
{% endnote %}

>解决：git push gitee HEAD:master 或者  git push gitee HEAD
