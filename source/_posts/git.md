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
<blockquote class="blockquote-center">学习git版本控制</blockquote>

#### 前提已安装git
![](https://upload-images.jianshu.io/upload_images/3098875-1877e83798fd9376.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
[git完整提交步骤--点击这里](https://www.jianshu.com/p/45ef8508a646)

<!--more-->
```
其他Git精华教程：  
1. [交互编程-15分钟学会github](http://try.github.io/levels/1/challenges/1)  
2. [书籍-重量级教程progit](https://github.com/numbbbbb/progit-zh-pdf-epub-mobi)  
3. [书籍-git magic](https://github.com/blynn/gitmagic/tree/master/zh_cn)  
4. [教程-如何高效利用GitHub](http://www.yangzhiping.com/tech/github.html)  
5. [教程-git immersion](http://gitimmersion.com/)  
[中文版](http://igit.linuxtoy.org/contents.html)  
6. [Pro Git](http://link.zhihu.com/?target=http%3A//git-scm.com/book/zh/v2)

Git学习资源
[Githug](https://github.com/Gazler/githug)： 墙裂推荐！！！
[「Githug」Git 游戏通关流程](http://www.jianshu.com/p/482b32716bbe)  
[Githug通关全攻略](http://fancyoung.com/blog/githug-cheat-sheet/)  
[Try Git](https://try.github.io/levels/1/challenges/1)  
[Learn Git Branching](http://pcottle.github.io/learnGitBranching/)  


## 参考资料
[必须要会的Git基本使用及常用命令操作](http://www.jianshu.com/p/555e7a188312)  
[全面理解Git](https://zhuanlan.zhihu.com/p/24081900)  
[Git常用命令总结](http://www.cnblogs.com/mengdd/p/4153773.html)  
[【开源必备】常用git命令](https://zhuanlan.zhihu.com/p/25868120)  
记住一句话：GIT是管理和跟踪是修改，而非是文件
```
##### 1.创建版本库(仓库)

###### 桌面创建文件夹

![3098875-a6af82f24c2585b9.png](https://upload-images.jianshu.io/upload_images/3098875-6bba9e69aa2d4102.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 2.让成为Git可以管理的仓库
```
初始化 git init
查看初始化目录：ls -ah
```
![3098875-b93d8981073c10b0.png](https://upload-images.jianshu.io/upload_images/3098875-cd00ebcfd69df3ed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


##### 3.添加文件到仓库
```
git add <file> 从工作区移到版本库中的stage(暂存区)
///可反复多次使用，添加多个文件；
git commit -m <message> 提交到把暂存区的所有内容提交到当前分支（特指是当前分支）
//注释
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-0fbe56c0c5d80242.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 4.修改提交的文件

查看修改的状态
```
git status
查看仓库当前的状态，readme.txt被修改过了，但还没有准备提交的修改
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-4aef8f0d159109af.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 4..查看对比文件修改

![image.png](https://upload-images.jianshu.io/upload_images/3098875-927658ac90317c1e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 4.2提交修改后的文件
```
git add <file>
git commit -m <message>
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-806da4801ddb750b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>结果：Git告诉我们当前没有需要提交的修改，而且，工作目录是干净（working tree clean）的

##### 5.回滚历史版本，回到某个时间的修改前的文件
在这之前看下我们提交和修改那几次哪些内容
```
git log 
//显示从最近到最远的提交日志
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-990ad40151409c23.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 5.1了解主要日志信息
```
  git log --pretty=oneline
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-7b9da28811f5befe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>前面的一长串的字符是：一个SHA1计算出来的一个非常大的数字，用十六进制表示 
commit id（版本号）相当于是提交历史的时间线

##### 5.3回滚版本

###### 5.3.1.先确定当前是那个版本号----那长串16进制     ,HEAD表示当前版本

![image.png](https://upload-images.jianshu.io/upload_images/3098875-b9fa24152f60c087.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

小知识点：
- 上一个版本就是HEAD^，
- 上上一个版本就是HEAD^^
- 多个的话用以下方法
- 往上前一千个版本就是HEAD~1000

###### 5.3.2.正式回滚
- 往上回滚一次
```
git reset --hard HEAD^
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-5c4ac3ada998eee8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 5.3.3.查看文件是否完成回滚
 ```
 cat  文件名.后缀
```
- 参照对比：

![image.png](https://upload-images.jianshu.io/upload_images/3098875-83b5f9bf103816a5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-70ba6f1502f9edab.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-83d977200fa740fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>关于日志信息问题
###### 5.3.4.Git Bash Here窗口没有关闭

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a1ab34a497072a24.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
通过版本号回滚
git reset --hard 版本号
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-1f66ee67a937f1d9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 便于好理解：
![image.png](https://upload-images.jianshu.io/upload_images/3098875-e35e263cd5473552.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 5.3.5.已关闭git  bash here 窗口
当你用$ git reset --hard HEAD^回退到add distributed版本时，再想恢复到append GPL时候，可是我TM已经找不到版本号了

```
git reflog 用来记录你的每一次命令
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-88341c5389dd8d07.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 从上到下顺序：
最新执行动作（就是刚刚干了什么sao事情）--->从最初创建这个文件时的动作到最新的所有的命令

##### 6工作区，暂存区

###### 6.1工作区：
![image.png](https://upload-images.jianshu.io/upload_images/3098875-c1d04b7ebb274c6f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 6.2暂存区:
.git隐藏目录
Git的版本库

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bf788e0c91308a60.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

版本库东西存N多
主要是
暂存区
默认分支master

![image.png](https://upload-images.jianshu.io/upload_images/3098875-6bc811f7065d0db4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
执行操作如下：
git add 文件名
git commit -m "信息" 

###### 6.3考试要考的：

![image.png](https://upload-images.jianshu.io/upload_images/3098875-e8010c93beeae2bd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


##### 7.管理修改

###### 7.1.过程：
- 第一次修改 -> git add   修改lxf.txt并提交到暂存区 

![image.png](https://upload-images.jianshu.io/upload_images/3098875-07203b62ecbb226a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 第二次修改 -> git commit 修改lxf.txt文件并提交到版本库

![image.png](https://upload-images.jianshu.io/upload_images/3098875-82983d94ddf81aea.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![image.png](https://upload-images.jianshu.io/upload_images/3098875-3f57b3f2d77ef847.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 第一次stastus

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bb2b89ff875b829b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 第二次status

![image.png](https://upload-images.jianshu.io/upload_images/3098875-a55448cf3ed7f109.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 查看工作区和版本库的不同

![image.png](https://upload-images.jianshu.io/upload_images/3098875-89052f9162b27c1a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 查看工作区和版本库里面最新版本的区别

![image.png](https://upload-images.jianshu.io/upload_images/3098875-0df784825c455fbc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-1d2a2b6404fb05c5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 8.撤销修改

###### 8.1过程:
- 增加一条错误的数据

![image.png](https://upload-images.jianshu.io/upload_images/3098875-022fe044263746a9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 8.1.1结果：
git撤销修改可以使用 git checkout -- 文件名
使用这个命令可以让工作区的修改全部撤销
但是分为以下两种

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bbda66abf0217c61.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 8.1.2情况是：
回到git commit 和git add 之前的文件内容

我这边是第一种情况----回到git add 之前的状态
就是如下图：

![image.png](https://upload-images.jianshu.io/upload_images/3098875-d71b64383272e68f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 8.2撤销操作：

![image.png](https://upload-images.jianshu.io/upload_images/3098875-09bc1d66913edf17.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-87127ac7dc8ff8b7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

所以我们git diff 就没有显示的内容

演示第二种情况----回到git commit 之前的状态

![image.png](https://upload-images.jianshu.io/upload_images/3098875-fe784b4c25fce749.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-59d94f0f5fc6f5e6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-7b04e1ddda90ee3a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-401d7895eeef0af3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


- git checkout 针对工作区
- git reset HEAD -- 文件名  针对暂存区
- git reset 既可以回退版本，也可以把暂存区的修改回退到工作区。当我们用HEAD时，表示最新的版本

###### 8.2删除文件内容操作
 
![image.png](https://upload-images.jianshu.io/upload_images/3098875-9434c6c2d57c2342.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 8.1.1创建分支

![image.png](https://upload-images.jianshu.io/upload_images/3098875-2d4e50be0ff94d68.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
git checkout命令加上-b参数表示创建并切换
相当以下两个命令：
git branch dev
git checkout dev
当前分支前面会标一个*号
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-d6118f74a5692a79.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-8231474a350a5639.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
>M：修改过
D：删除了 

git merge dev 合并到主分支上去

![image.png](https://upload-images.jianshu.io/upload_images/3098875-2012c0f4e7de382c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

注意到上面的Fast-forward信息，Git告诉我们，这次合并是“快进模式”，也就是直接把master指向dev的当前提交，所以合并速度非常

![image.png](https://upload-images.jianshu.io/upload_images/3098875-9c2c4bdf7105b89a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

git branch -d dev 删除已合并的分支

![image.png](https://upload-images.jianshu.io/upload_images/3098875-b5acd7881112701a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
小结：

![image.png](https://upload-images.jianshu.io/upload_images/3098875-4a1ee88385003e17.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 9.解决冲突

过程:
创建新分支 feature1
修改其中一条内容

![image.png](https://upload-images.jianshu.io/upload_images/3098875-51725caa9ed5b95e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

master主分支：

![image.png](https://upload-images.jianshu.io/upload_images/3098875-9a2bcba9ee9eb724.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

合并出现冲突

![image.png](https://upload-images.jianshu.io/upload_images/3098875-bff6bd6c44c9ef2e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

解决冲突：

![image.png](https://upload-images.jianshu.io/upload_images/3098875-2948d27a43a6a59c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
<<<<<<
当前主分支（已提交至版本库中的内容）
======
其他分支（已做修改准备提交版本库内容）
>>>>>>
```


![image.png](https://upload-images.jianshu.io/upload_images/3098875-3caa7500a67a81ca.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

之后参看日志分支

![image.png](https://upload-images.jianshu.io/upload_images/3098875-b50f9b9ccbaedaff.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

删除分支（可选）

![image.png](https://upload-images.jianshu.io/upload_images/3098875-954fc9fad20f41d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

分支管理策略
过程：
创建分支Dev 修改内容
切换至master分支

![image.png](https://upload-images.jianshu.io/upload_images/3098875-9d7be56518847511.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-135cbe95f840e874.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3098875-0c07777f84714783.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


推荐使用：git merge --no-ff -m"注释" 分支名

git stash用法

引用老师的场景：
比如与你接到一个修复一个代号001的bug的任务时，很自然地，你想创建一个分支issue-001来修复它，但是，等等，当前正在dev上进行的工作还没有提交，但是工作只进行到一半，还没法提交，预计完成还需1天时间。但是，必须在两个小时内修复该bug，怎么办？

stash相当于 把手上的工作在“藏起来”，解决问题后再继续完成手上的工作

实操：

![image.png](https://upload-images.jianshu.io/upload_images/3098875-07ec6e07b54c5168.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

假设dev正在工作的代码
BUG出现在master上面
操作1. 保存dev分内容

![image.png](https://upload-images.jianshu.io/upload_images/3098875-7d9b8c593a572a76.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

操作2.
切换分支
 修复bug
 将"学习分支管理策略"改成"学习解决BUG分支"，并提交

![image.png](https://upload-images.jianshu.io/upload_images/3098875-c0a4058468ee9039.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

切换至master分支

![image.png](https://upload-images.jianshu.io/upload_images/3098875-17308efa58375bc2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

接着回去dev分支进行开发

查看stash内容
git stash list

恢复stash内容
一是用git stash apply恢复，但是恢复后，stash内容并不删除，你需要用git stash drop来删除；
二用git stash pop，恢复的同时把stash内容也删了

![image.png](https://upload-images.jianshu.io/upload_images/3098875-c6eeda30931bcc43.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Feature分支学习

![image.png](https://upload-images.jianshu.io/upload_images/3098875-92bba3879ae692ea.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

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
```查看远程库信息，使用git remote -v；
本地新建的分支如果不推送到远程，对其他人就是不可见的；
从本地推送分支，使用git push origin branch-name，如果推送失败，先用git pull抓取远程的新提交；
在本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branch-name，本地和远程分支的名称最好一致；
建立本地分支和远程分支的关联，使用git branch --set-upstream branch-name origin/branch-name；
从远程抓取分支，使用git pull，如果有冲突，要先处理冲突。
```





