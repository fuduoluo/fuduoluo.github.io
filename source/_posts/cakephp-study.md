---
title: CakePHP学习
permalink: 'posts/:abbrlink.html'
copyright: true
categories: cakephp
tags: cakephp
abbrlink: cf2bd071
date: 2019-10-29 17:16:25
updated: 2019-10-29 17:16:25
subtitle:
---
<meta name="referrer" content="never">
{% note success %}
CakePHP学习的水平只有这么点
{% endnote %}

![CakePHP](https://cakephp.org/images/slider/slide-1.jpg)

##### 不定期持续更新学习中.....
<!--more-->
##### 主要基于Cakephp 2.x版本进行总结
[Cakephp 2.x版本APi](https://api.cakephp.org/2.10/package-Cake.html)

#####   Cakephp命名规范
- 控制器
 ```
控制器的类名是复数，首字母大写, 并且以 Controller 结尾。
例子：UsersController 和 ArticleCategoriesController 。
$this->User  单数
```
- 访问控制器URL
 ```
单个单词的控制器映射到一个简单的小写URL路径。例如 `UsersController` 
（将是定义在名称为 **UsersController.php** 的文件中）
可以从 
[http:\/\/example.com/项目名/控制器类复数]
(http:\/\/example.com/demo/users) 
注意：
访问的URL路径是小写并且用 DashedRoute 类来分割。
/article-categories/view-all 是
访问 ArticleCategoriesController::viewAll() 方法的正确方式。
```

- 文件名和类名命名
```
控制器类  LatestArticlesController 将对应文件名 LatestArticlesController.php
组件类   MyHandyComponent 将对应文件名 MyHandyComponent.php
Table 类   OptionValuesTable 将对应文件名 OptionValuesTable.php.
Entity 类    OptionValue 将对应文件名 OptionValue.php.
Behavior 类   EspeciallyFunkableBehavior 将对应文件名 EspeciallyFunkableBehavior.php
视图类   SuperSimpleView 将对应文件名 SuperSimpleView.php
Helper 类   BestEverHelper 将对应文件名 BestEverHelper.php
```
-数据库表名命名
```
需与Model层名字对应并且     复数形式并用下划线分割(两个单词以上)
 users, article_categories, 和 user_favorite_pages 等。
```
- 模型层命名
```
单数形式
主要是分两类
Table 类名是复数、首字母大写、以 Table 结尾的。

UsersTable、ArticleCategoriesTable
 分别是对应 users、article_categories表的 table 类名。

Entity 类名是单数、首字母大写、无后缀的。
User、ArticleCategory 
分别是对应 users、article_categories表的 entity 类名。
```
- 视图层命名
```
视图模板文件使用它对应的控制器方法的名字以下划线形式命名。
ArticlesController 类的 viewAll()
防范将会对应视图模板文件 src/Template/Articles/view_all.ctp。
```
- 请求方式与获取
```
POST 数据可以通过 $this->request->getData() 获取
GET 数据可以通过 $this->request->query()获取
```
- debug打印变量内容信息
```
检查它里面的数据内容，我们可以通过方法    pr() 或者 debug()
```
- Edit编辑功能页面信息提示
```
2.3版本
 $this->Session->setFlash('edit successfully');
2.10以上版本
 $this->Flash->success(__('Your article has been updated.'));//提示更新成功信息
 $this->Flash->error(__('Unable to update your article.'));//提示更新失败信息
```
- 绑定至视图
```
  $this->set(compact('article'));
  $this->set('article', $article); 
//注入article视图 使用 set() 函数将数据传入模版（将在下部分创建）CakePHP 将会自动渲染模版。
```
- cookie使用
```
//配置cookie
$this->Cookie->configKey('User', [
    'expires' => '+10 days',
    'httpOnly' => true
]);
//配置参数如下
expires  path domain  secure   key httpOnly  entryption
//设置cookie值
$this->Cookie->write('name', 'Larry');
$this->Cookie->write('User',
    ['name' => 'Larry', 'role' => 'Lead']
);
$this->Cookie->configKey('User', 'encryption', false);
//读取cookie
$this->Cookie->read('User');
//删除cookie
$this->Cookie->delete('foo.bar');
```
- Paginator分页
```
class ArticlesController extends AppController
{
    public $paginate = [
        'fields' => ['Articles.id', 'Articles.created'],
        'conditions' => $conditions,
        'limit' => 25,
        'order' => [
            'Articles.title' => 'asc'
        ]
    ];

    public function initialize()
    {
        parent::initialize();
        $this->loadComponent('Paginator');
    }
}

 $conditions = $this->_filter($this->request->query, $depts);
 $this->paginate = array(
     'paramType' => 'querystring',
     'conditions' => $conditions,
     'limit' => 15,
      'order' => 'MonthlyTarget.id DESC'
 );
```
- 前端视图页面
```
三部分组成
布局：
布局文件存放在/app/views/layouts 目录中。可以通过创建
/app/views/layouts/default.ctp 文件来覆盖 CakePHP 的默认布局。一旦新的默认布局被创
建，控制器显示的视图代码就会被放到新的布局中去。

元素:重复使用的代码块

助手
```
- cakephp 关联关系
[cakephp 关联关系理解](https://www.php1.cn/detail/CakePHP_GuanLianGuanXi.html)

##### window环境下使用cake bake  生成 M V C 文件
###### 确定console文件位置
![image.png](https://upload-images.jianshu.io/upload_images/3098875-1962723df77b5b8f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
遇到问题
需要配置系统环境变量
cake bake  和php
配置完成后重新打开命令行--->我使用git bash
运行 php -v看是否正常
```
![image.png](https://upload-images.jianshu.io/upload_images/3098875-d4f536f1cbfa42c9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 生成对应的数据表MVC文件
![image.png](https://upload-images.jianshu.io/upload_images/3098875-5a1d711718e4fc5c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 常用的Model的方法
###### 查询方法：
[具体介绍](https://book.cakephp.org/2.0/zh/models/retrieving-your-data.html)

```
find( string $type = 'first' , array $query = array() )
find('first');
返回一个结果，你可以在任何期望获得一个结果的情况下使用它

find('list'); 
使用find('list')返回的是键值对的数组,快速实现下拉菜单,合并成为一个数组

find('all');
返回一个数组，可能包含多个结果

find('count');
返回一个整数值

find('threaded');
返回一个嵌套数组，适用于想使用模型数据的 parent_id 字段来建立嵌套结果的情况。
更好的处理嵌套的数据 使用tree行为。

find('neighbors');
返回查询的记录的 前一条和后一条记录 类似first
findByxx();

例子：
$model->find('all', array(
  'conditions' => array('name' => 'Thomas Anderson'),
  'fields' => array('name', 'email'),
  'order' => 'field3 DESC',
  'recursive' => 1,
  'group' => 'type',
  'callbacks' => false,
));
```
###### 保存方法：
[具体介绍](https://book.cakephp.org/2.0/zh/models/saving-your-data.html)

```
Model::save();保存数组格式的数据

Model::saveAll();
saveAll 函数只是 saveMany 方法和 saveAssociated 方法的包装。
它会检查 数据并且决定应当执行哪种类型的保存。
如果数据是数字索引数组的格式，就会调用 saveMany 方法，否则调用 saveAssociated 方法。

Model::create();保存新数据重置模型的状态
Model::saveField();保存单个字段的值
Model::updateAll();用一次调用更新一条或多条记录
Model::saveMany();用于同时保存同一模型的多行
Model::saveAssociated();用于同时保存多个模型关联
$this->MonthlyTarget->save($this->request->data)
```
###### 关联模型
```
Controller::loadModel(string $modelClass, mixed $id)
当要使用的模型不是控制器的缺省模型或者关联模型
$this->loadModel('Article');
$recentArticles = $this->Article->find(
    'all',
    array('limit' => 5, 'order' => 'Article.created DESC')
);

$this->loadModel('User', 2);
$user = $this->User->read();
```
