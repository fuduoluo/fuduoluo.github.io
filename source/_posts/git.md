---
title: git学习小记
permalink: 'posts/:abbrlink.html'
copyright: true
abbrlink: 518e617c
date: 2019-07-11 22:18:18
updated: 2019-07-11 22:18:18
categories: git学习小记
tags: git学习
subtitle:
---
<blockquote class="blockquote-center">学习git版本控制，本文参照廖雪峰老师讲解进行实操,资源来自网络</blockquote>

#### Git知识体系
![网上git知识体系](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-1877e83798fd9376.png)
[参照GIT完整提交步骤](https://www.jianshu.com/p/45ef8508a646)

<!--more-->

#### 1.创建本地版本库(仓库)
![创建本地仓库](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-6bba9e69aa2d4102.png)

#### 2.初始化本地仓库
```
git init 初始化
查看初始化目录：ls -ah
```
![初始化目录成可管理的git仓库](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-cd00ebcfd69df3ed.png)
#### 3.添加文件到仓库
```
git add 文件名
从工作区移到版本库中的stage(暂存区)
//可反复多次使用，添加多个文件；
git commit -m "注释信息" 
提交到把暂存区的所有内容提交到当前分支（特指是当前分支）
//注释
```
![添加至暂存区并注释](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-0fbe56c0c5d80242.png)
#### 4.修改提交到暂存区的文件
```
查看修改的状态
git status
查看仓库当前的状态，readme.txt被修改过了，但还没有准备提交的修改
```
![查看修改后文件状态](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-4aef8f0d159109af.png)
#### 4.1.查看对比本地文件和暂存区修改
![对比差异](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-927658ac90317c1e.png)
#### 4.2提交修改后的文件
![提交文件](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-806da4801ddb750b.png)

>Git告诉我们当前没有需要提交的修改，working tree clean

#### 5.查看提交历史和日志
```
查看前几次提交历史
git log  显示从最近到最远的提交日志
```

![查看提交历史](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-990ad40151409c23.png)

#### 5.1查看提交日志内容

```
  git log --pretty=oneline
```

![查看提交日志内容](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-7b9da28811f5befe.png)

> 前面的长串的字符：SHA1计算出来十六进制表示 的数字 commit id（版本号）相当于是提交历史的时间线


#### 5.3回滚历史版本

![确定回滚版本号](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-b9fa24152f60c087.png)

{% note success%}
小知识点：
 上一个版本就是HEAD^，
上上一个版本就是HEAD^^
多个的话用以下方法
往上前一千个版本就是HEAD~1000
{% endnote %}

#### 5.3.1回滚操作
- 向提交历史回滚一次
```
git reset --hard HEAD^
```
![回滚上一次提交历史](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-5c4ac3ada998eee8.png)

#### 5.3.2.查看文件是否完成回滚
 ```
法1：
git bash
 cat  文件名.后缀
法2：
直接打开编辑器查看文件是否回滚成功[推荐]
```
参照对比：

![查看提交历史情况](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-83b5f9bf103816a5.png)

![查看内容是否回滚](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-70ba6f1502f9edab.png)

![查看提交历史](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-83d977200fa740fe.png)

>查看日志信息问题
#### 5.3.3 Git Bash Here窗口没有关闭

![未关闭状态](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-a1ab34a497072a24.png)

![回滚完成](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-1f66ee67a937f1d9.png)

- 理解：
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-e35e263cd5473552.png)

#### 5.3.4已关闭git  bash here 窗口
当你用$ git reset --hard HEAD^回退到add distributed版本时，再想恢复到append GPL时候，可是我TM已经找不到版本号了

```
git reflog 用来记录你的每一次命令
```
![使用git reflog 查看版本号](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-88341c5389dd8d07.png)
```
终极大法   git reset --hard 版本号
```

#### 6工作区暂存区

#### 6.1工作区：
![本地文件](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-c1d04b7ebb274c6f.png)

#### 6.2暂存区:
.git隐藏目录
Git的版本库

![暂存区](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-bf788e0c91308a60.png)

![工作区和暂存区关系](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-6bc811f7065d0db4.png)

#### 6.3重点理解git diff命令：

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-e8010c93beeae2bd.png)


#### 7.管理修改

#### 7.1.过程：
- 第一次修改 -> git add   修改lxf.txt并提交到暂存区 

![lxf.txt修改前文件内容](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-07203b62ecbb226a.png)

![查看状态](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-bb2b89ff875b829b.png)
- 第二次修改 -> git commit 修改lxf.txt文件并提交到暂存区

![lxf.txt commit后内容](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-82983d94ddf81aea.png)

![git add 后的状态](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-3f57b3f2d77ef847.png)

![commit后的状态](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-a55448cf3ed7f109.png)

- 查看工作区和版本库的不同

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-89052f9162b27c1a.png)

- 查看工作区和版本库里面最新版本的区别

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-0df784825c455fbc.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-1d2a2b6404fb05c5.png)

#### 8.撤销修改

#### 8.1过程:
- 增加一条错误的数据

!["+"-"区别](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-022fe044263746a9.png)

#### 8.1.1结果：
```
git撤销修改
git checkout -- 文件名
git checkout . 
可以让工作区的修改全部撤销
```
分以下两种

![撤销分情况](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-bbda66abf0217c61.png)

#### 8.1.2执行撤销：
回到git commit 和git add 之前的文件内容
我属于第一种情况----回到git add 之前的状态
就是如下图：

![](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-d71b64383272e68f.png)

#### 8.2撤销操作：

![执行撤销操作](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-09bc1d66913edf17.png)

![注意](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-87127ac7dc8ff8b7.png)

所以我们git diff 就没有显示的内容

演示第二种情况----回到git commit 之前的状态

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-fe784b4c25fce749.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-59d94f0f5fc6f5e6.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-7b04e1ddda90ee3a.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-401d7895eeef0af3.png)

{% note danger%}
- git checkout  针对工作区
- git reset HEAD -- 文件名  针对暂存区
- git reset 既可以回退版本，也可以把暂存区的修改回退到工作区。当我们用HEAD时，表示最新的版本
{% endnote %}


#### 8.3删除文件内容操作
 
![删除文件内容操作](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-9434c6c2d57c2342.png)

#### 8.4创建新的本地分支

![创建本地新分支](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-2d4e50be0ff94d68.png)
{% note danger%}
git checkout 加上-b参数  表示创建并切换
相当以下两个命令：
git branch dev
git checkout dev
当前分支前面会标一个*号
{% endnote %}

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-d6118f74a5692a79.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-8231474a350a5639.png)
{% note danger%}
M：修改过
D：删除了 
{% endnote %}

#### 8.5合并分支至主分支
```
git merge 合并分支名
```
![合并操作](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-2012c0f4e7de382c.png)
{% note danger%}
注意到上面的Fast-forward信息，Git告诉我们，这次合并是“快进模式”，也就是直接把master指向dev的当前提交，所以合并速度非常
{% endnote %}

![查看合并情况](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-9c2c4bdf7105b89a.png)

#### 8.6 删除已合并的分支
```
git branch -d 本地分支名
```
![查看删除情况](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-b5acd7881112701a.png)

![小结](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-4a1ee88385003e17.png)

#### 9.重现简单冲突
{% note danger%}
创建新分支 feature1修改其中一条内容
{% endnote %}
![分支](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-51725caa9ed5b95e.png)

![主分支](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-9a2bcba9ee9eb724.png)

![合并后出现冲突提示](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-bff6bd6c44c9ef2e.png)

解决冲突：

![冲突范围符号](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-2948d27a43a6a59c.png)

```
<<<<<<
当前主分支（已提交至版本库中的内容）
======
其他分支（已做修改准备提交版本库内容）
>>>>>>
```


![删除无用代码解决提交冲突](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-3caa7500a67a81ca.png)



![查看日志分支](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-b50f9b9ccbaedaff.png)

![删除解决的分支（可选）](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-954fc9fad20f41d4.png)

#### 10.分支管理策略

创建分支Dev 修改内容
切换至master分支

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-9d7be56518847511.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-135cbe95f840e874.png)

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-0c07777f84714783.png)

{% note success%}
墙裂推荐使用：git merge --no-ff -m"注释" 分支名
{% endnote %}
#### 11.git stash用法
{% note danger%}
引用老师的场景：
比如与你接到一个修复一个代号001的bug的任务时，很自然地，你想创建一个分支issue-001来修复它，但是，等等，当前正在dev上进行的工作还没有提交，但是工作只进行到一半，还没法提交，预计完成还需1天时间。但是，必须在两个小时内修复该bug，怎么办？
{% endnote %}
```
stash相当于 把手上的工作在“藏起来”，解决问题后再继续完成手上的工作
```
实操：

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-07ec6e07b54c5168.png)


操作1. 假设dev正在工作的代码 BUG出现在master上面 保存dev分内容

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-7d9b8c593a572a76.png)

操作2.切换分支 修复bug  将"学习分支管理策略"改成"学习解决BUG分支"，并提交
![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-c0a4058468ee9039.png)

切换至master分支

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-17308efa58375bc2.png)

接着回去dev分支进行开发

查看stash内容
git stash list

恢复stash内容
一是用git stash apply恢复，但是恢复后，stash内容并不删除，你需要用git stash drop来删除；
二用git stash pop，恢复的同时把stash内容也删了

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-c6eeda30931bcc43.png)

Feature分支学习

![image.png](https://phpcoder-1259614901.cos.ap-guangzhou.myqcloud.com/phpcoder/git%E5%AD%A6%E4%B9%A0%E5%B0%8F%E8%AE%B0/3098875-92bba3879ae692ea.png)

多人协作开发
```
1.--------查看远程连接
git remode -v
2.--------删除远程连接
$ git remote rm github
以上github 是远程仓库在本地Git中的名称
3.---------修改远程连接
git remte set-url origin URL
4.--------删除本地分支
git branch -d 本地分支名称
5.-------删除远程分支
git push --delete 链接别名  远程分支名
6.--------拉取远程分支（基于master分支，远程新建分支）
git pull 拉取全部分支
 git fetch origin（连接别名） master（分支）
 //从远程的origin仓库的master分支下载代码到本地的origin master
git fetch origin master:temp //从远程的origin仓库的master分支下载到本地并新建一个分支temp
切换分支temp
1.git add .  2.git commit 注释  3.git push origin temp

```
还有一种[git 本地给远程仓库创建分支](https://www.cnblogs.com/Amos-Turing/p/6285390.html)
```
查看远程库信息，使用git remote -v；
本地新建的分支如果不推送到远程，对其他人就是不可见的；
从本地推送分支，使用git push origin branch-name，如果推送失败，先用git pull抓取远程的新提交；
在本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branch-name，本地和远程分支的名称最好一致；
建立本地分支和远程分支的关联，使用git branch --set-upstream branch-name origin/branch-name；
从远程抓取分支，使用git pull，如果有冲突，要先处理冲突。
```

#### Git学习资源
[Githug](https://github.com/Gazler/githug) 墙裂推荐!!!
[Githug Git 游戏通关流程](http://www.jianshu.com/p/482b32716bbe) 
[Githug 通关全攻略](http://fancyoung.com/blog/githug-cheat-sheet/) 
[Try Git](https://try.github.io/levels/1/challenges/1)
[Learn Git Branching](http://pcottle.github.io/learnGitBranching/)
[必须要会的Git基本使用及常用命令操作](http://www.jianshu.com/p/555e7a188312)
[全面理解Git](https://zhuanlan.zhihu.com/p/24081900)
[Git常用命令总结](http://www.cnblogs.com/mengdd/p/4153773.html)
[常用git命令](https://zhuanlan.zhihu.com/p/25868120)
[交互编程-15分钟学会github](http://try.github.io/levels/1/challenges/1)
[书籍-重量级教程progit](https://github.com/numbbbbb/progit-zh-pdf-epub-mobi) 
[书籍-git magic](https://github.com/blynn/gitmagic/tree/master/zh_cn)
[教程-如何高效利用GitHub](http://www.yangzhiping.com/tech/github.html)
[教程-git immersion](http://gitimmersion.com/)
[中文版](http://igit.linuxtoy.org/contents.html)
[Pro Git](http://link.zhihu.com/?target=http%3A//git-scm.com/book/zh/v2)





