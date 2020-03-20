---
title: git常见操作命令与问题
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 888d2e2
date: 2019-07-11 22:32:11
updated: 2019-07-11 22:32:11
categories: git
tags: git操作命令
subtitle:
cover: data:image/png;base64,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
---
<blockquote class="blockquote-center">自己工作git常见操作</blockquote>

#### 标准Git注解
第1行：提交修改内容的摘要
第2行：空行
第3行以后：修改的理由
#### 初始化git
```
git init
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-aa08eb0c8eea9641.png)
<!--more-->
#### 连接git
```
git remote add l链接别名 git地址链接
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-84b3a36deb70c062.png)

#### 克隆git分支
```
git clone -b 分支名  git链接地址//克隆特定分支
git clone 分支名 git链接地址 //默认克隆master分支
```
#### 查看本地git分支
```
git branch -a //查看全部地址分支
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-ef916c40ab81e016.png)
#### 删除本地git分支
```
git branch -d/-D 分支名 
```
#### 查看git状态
```
git status
```
#### 切换分支git
```
git checkout 分支名
gitcheckout -b 分支名  // 新建本地分支并切换到当期分支
```
#### 保存当前正在敲的工作区git代码----在当前分支上进行暂存工作区代码
```
git stash
用下面这个代替
推荐给每个stash加一个message，用于记录版本
git stash save "注释"
```
#### 查看当前正在敲的工作区git代码
```
git stash list
```
#### 移除stash
```
$ git stash list
stash@{0}: WIP on master: 049d078 added the index file
stash@{1}: WIP on master: c264051 Revert "added file_size"
stash@{2}: WIP on master: 21d80a5 added number to log
$ git stash drop stash@{0}
Dropped stash@{0} (364e91f3f268f0900bc3ee613f9f733e82aaed43)
```
#### 查看指定stash的diff
```
git stash show 文件名
```
#### 查看远程连接
```
git remode -v
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-dbe574874e1c02e6.png)

#### 删除远程连接
```
git remote rm github
```
#### 重置远程连接git
```
git remte set-url origin URL
```
#### 新建远程分支并把它PUSH远程仓库
```
1.切换到当前分支
git checkout master //进入develop分支
2.根据当前分支新建一个分支
git checkout -b dev //以master为源创建本地分支dev
3.推送到远程分支
git push origin dev //将本地fromdevelop分支作为远程dev分支

```
#### 删除远程git分支
```
git push --delete 链接别名[origin]  远程分支名
```
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-1b317fd2f097f390.png)

#### 删除远程仓库文件
```
git rm -r --cached 文件夹/文件名
```
#### git rebase 使用场景和方法

[git rebase出处](https://www.jianshu.com/p/f7ed3dd0d2d8)

##### 不同分支之间的合并

{% note success %}
开发新功能在分支上，测试完成后合并到主分支上
一般步骤如下：
{% endnote %}

```
1.新建新分支
git checkout -b feature

2.开发新功能[以文件代替]
vim newFunc.go
git add newFunc.go
git commit -m 'add new func'

3.查看提交日志和分支情况
git log --oneline --graph
git branch

4.合并分支
有两种方法「有冲突自行解决在提交保存」
4.1:切换到主分支master,使用git merge feature「易造成分支历史日志混乱」

4.2:使用git rebase

4.2.1:切换到新功能分支下
4.2.2:在分支上执行「git rebase master」
解释：以master为基础，将feature分支上的修改增加到master分支上，并生成新的版本。
git rebase master
4.2.3:产生冲突时候并解决后 使用 git rebase --continue继续完成之前的操作
4.2.4:查看提交历史日志[自己衡量是否需要]
4.2.5:合并至主分支上面去
    切换到主分支上 git checkout master
    执行 git merge feature
4.2.6:删除本地分支 git branch -d  分支名
      删除远程分支 git push --delete 链接别名[origin]  远程分支名
```


#### 拉取git分支（远程新建分支）

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
#### 解决冲突
[查看解决冲突](https://www.jianshu.com/p/b69f6dc03f55)

#### 回滚
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
#### 修改最近上一次commit的注释信息
```
git commit --amend
```
#### 查看版本号信息「提交历史」
```
git shortlog 用户提交哪些组，再次显示简洁的主题行
git reflog
git log --oneline --graph

```
#### 忽略.idea文件夹下文件
```
git rm -r --cached .idea
删除idea缓存
.gitignore中添加.idea

```
#### git pull时出现冲突 放弃本地修改，使远程库内容强制覆盖本地代码
```
git fetch --all //只是下载代码到本地，不进行合并操作
git reset --hard origin/master  //把HEAD指向最新下载的版本
```

#### git 设置不用每次都输入 账号密码
```
执行一下 这个命令：
git config --global credential.helper store
然后，下次再输入一次 账号密码 就可以了。

windown下修改拉取仓库代码登录账号密码
[具体](https://blog.csdn.net/qq_29298577/article/details/84314200)
控制面板 -----> 用户账户------> 管理windows凭据------>找到对应的地址修改登录名称和密码即可
```

#### git merge 出现以下错误
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E6%97%A5%E5%B8%B8%E6%93%8D%E4%BD%9C/3098875-477e115aad7f2129.png)

```
git merge 分支名 --allow-unrelated-histories
```
#### git pull使用

```
git pull = git fetch + git merge FETCH_HEAD 

git pull --rebase =  git fetch + git rebase FETCH_HEAD 「推荐使用」
```

#### git pull 出现以下错误

```
拒绝合并不相关历史
fatal: refusing to merge unrelated histories
git pull --allow-unrelated-histories
```

#### git clone报错

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