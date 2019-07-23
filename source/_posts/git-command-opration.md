---
title: git常见操作命令
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 888d2e2
date: 2019-07-11 22:32:11
updated: 2019-07-11 22:32:11
categories: git命令
tags: git命令
subtitle:
---
<blockquote class="blockquote-center">自己工作git常见操作</blockquote>

#### 标准Git注解
第1行：提交修改内容的摘要
第2行：空行
第3行以后：修改的理由
###### 初始化git
```
git init
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-aa08eb0c8eea9641.png)
<!--more-->
###### 连接git
```
git remote add l链接别名 git地址链接
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-84b3a36deb70c062.png)

###### 克隆git分支
```
git clone -b 分支名  git链接地址//克隆特定分支
git clone 分支名 git链接地址 //默认克隆master分支
```
###### 查看本地git分支
```
git branch -a //查看全部地址分支
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-ef916c40ab81e016.png)
###### 删除本地git分支
```
git branch -d/-D 分支名 
```
###### 查看git状态
```
git status
```
###### 切换分支git
```
git checkout 分支名
gitcheckout -b 分支名  // 新建本地分支并切换到当期分支
```
###### 保存当前正在敲的工作区git代码----在当前分支上进行暂存工作区代码
```
git stash
用下面这个代替
推荐给每个stash加一个message，用于记录版本
git stash save "注释"
```
###### 查看当前正在敲的工作区git代码
```
git stash list
```
###### 移除stash
```
$ git stash list
stash@{0}: WIP on master: 049d078 added the index file
stash@{1}: WIP on master: c264051 Revert "added file_size"
stash@{2}: WIP on master: 21d80a5 added number to log
$ git stash drop stash@{0}
Dropped stash@{0} (364e91f3f268f0900bc3ee613f9f733e82aaed43)
```
###### 查看指定stash的diff
```
git stash show 文件名
```
###### 查看远程连接
```
git remode -v
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-dbe574874e1c02e6.png)

###### 删除远程连接
```
git remote rm github
```
###### 重置远程连接git
```
git remte set-url origin URL
```
###### 删除远程git分支
```
git push --delete 链接别名  远程分支名
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-1b317fd2f097f390.png)

###### 拉取git分支（远程新建分支）

```
1.
git fetch origin（连接别名） master（分支）
git add.
git commit -m 注释
git push
完成远程新建分支
2.
git branch 分支名
git push origin(链接别名) 分支名
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-f8359479aa69fc43.png)
###### 解决冲突
[查看解决冲突](https://www.jianshu.com/p/b69f6dc03f55)

###### 回滚
``` 
git reset --hard HEAD^ 回到上一个版本
git reset --hard HEAD~10 回到第10个之前
git reflog 用来记录你的每一次命令
git reset --hard 版本号

已经Git push 上去，回滚
用git revert来撤销已经提交的更改，而git reset用来撤销没有提交的更改
git revert HEAD~3 //丢弃最近的三个commit，把状态恢复到最近的第四个commit，并且提交一个新的commit来记录这次改变
git revert -n master~5..master~2
//丢弃从最近的第五个commit（包含）到第二个（不包含）,但是不自动生成commit，这个revert仅仅修改working tree和index。
```
###### 修改最近上一次commit的注释信息
```
git commit --amend
```
###### 查看版本号信息
```
git shortlog 用户提交哪些组，再次显示简洁的主题行
git reflog
git log 

```
###### 忽略.idea文件夹下文件
```
git rm -r --cached .idea
删除idea缓存
.gitignore中添加.idea

```
###### git pull时出现冲突 放弃本地修改，使远程库内容强制覆盖本地代码
```
git fetch --all //只是下载代码到本地，不进行合并操作
git reset --hard origin/master  //把HEAD指向最新下载的版本
```

###### git 设置不用每次都输入 账号密码
```
执行一下 这个命令：
git config --global credential.helper store
然后，下次再输入一次 账号密码 就可以了。
```

###### git merge 出现以下错误
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-477e115aad7f2129.png)

```
git merge 分支名 --allow-unrelated-histories
```

###### git pull 出现以下错误

```
拒绝合并不相关历史
fatal: refusing to merge unrelated histories
git pull --allow-unrelated-histories
```

###### git clone报错

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-bb5704ee6a442f76.png)

[使用Git clone代码失败的解决方法](https://www.jianshu.com/p/f5295c74ee39)

```
error: RPC failed; curl 56 OpenSSL SSL_read: SSL_ERROR_SYSCALL, errno 10054
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed
因为Git限制了推送数据的大小导致的错误。

解决方法：重新设置通信缓存大小
git config http.postBuffer 524288000
git config --global http.postBuffer 524288000

之后执行
 git config http.sslVerify "false"
出现错误：fatal: not in a git directory
在执行
git config --global http.sslVerify false
```

还在补充中ing......