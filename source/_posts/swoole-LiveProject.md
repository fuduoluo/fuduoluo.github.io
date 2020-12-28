---
title: Swoole编译安装和TP5接入使用等问题

copyright: true
abbrlink: 5d473dd
date: 2019-10-29 17:12:01
updated: 2019-10-29 17:12:01
categories: Swoole
tags: Swoole 
subtitle:
cover: https://i.loli.net/2020/03/22/QIoP2rFjqyBeNcv.png
---

![swoole新手入门手册](http://noobcourse.php20.cn/NoobCourse/Introduction.html)

{% note success flat %}
Swoole编译安装和TP5接入使用等问题
{% endnote %}

{% note danger flat %}
 以下是通过PHP7.2.23和Swoole4.4.9安装编译遇到的问题！
 PHP7.2.23安装路径/home/var/www/soft/php   
 swoole 编译安装目录 /home/var/www/soft/php/lib/php/extensions
{% endnote %}

####  记住以下两个命令
```
查看PHP扩展
php -m
查看swoole扩展
php --ri swoole
查找文件
find /|grep 文件名

杀死进程
netstat -nlp 查看占用端口号的服务 
netstat -nlp | grep :3306  用管道符给grep处理 只查看3306这个端口号
nestat -anp | grep :3306
kill -9 pid[端口号进程ID]
```

#### 在Linux下，编译安装PHP时报错libxml2 configure: error
```
在Linux下，编译安装PHP时报错：
libxml2 configure: error: xml2-config not found. 
Please check your libxml2 installation.

但是在Linux下已经安装了libxml2，
我通过rpm -qa | grep libxml2就可以查到，那为什么还会提示那个错误呢

解决方法：
安装的版本应该是libxml2-dev
1.ubuntu/debian镜像:
sudo apt-get install libxml2-dev

centos/redhat镜像:
2.sudo yum install libxml2-devel
```
![image.png](https://i.loli.net/2020/03/22/7xPR6FVoQHyE2Wt.png)

#### 解决PHP 7编译安装错误：cannot stat ‘phar.phar’: No such file or directory，主要包括解决PHP 7编译安装错误：cannot stat ‘phar.phar’: No such file or directory
```
cp -pR -f phar.phar /usr/local/php7/bin/phar
cp: cannot stat 'phar.phar': No such file or directory
make: *** [install-pharcmd] Error 1
解决办法
find . -name 'phar.phar'
找到 phar.phar 文件, 移动或者复制到安装指令执行的目录下就行了.
```
#### 执行phpize进行扩展PHP扩展模块出现以下问题
phpize：增加php扩展服务
```
[vagrant@bogon swoole]$ /home/var/www/soft/php/bin/phpize
Configuring for:
PHP Api Version:         20170718
Zend Module Api No:      20170718
Zend Extension Api No:   320170718
Cannot find autoconf. Please check your autoconf installation and the
$PHP_AUTOCONF environment variable. Then, rerun this script.
解决方法：
sudo yum install autoconf
```
#### 添加到系统环境变量
```
解决php -v查看到版本于phpinfo()打印的版本不一致问题

查看执行那个php.ini
php -i | grep php.ini

vi /etc/profile
export PATH=执行php路径:$PATH
export PATH=/www/server/php/70/bin:$PATH

保存退出
source /etc/profile
2.
宝塔面板：
删除先前存在文件
rm-f /usr/bin/php
默认版本改成72
ln -sf /www/server/php/72/bin/php /usr/bin/php
```
#### 执行将swoole扩展模块添加到PHP7扩展

```
linux下执行以下命令
解压完成后
进入 swoole解压目录  
cd swoole 
执行 /www/server/php/72/bin/phpize
./configure  --with-php-config= /www/server/php/72/bin/php-config

报错：
configure: error: C++ preprocessor "/lib/cpp" fails sanity check
解决方法：
 yum install glibc-headers
 yum install gcc-c++

3.编译：make
4.执行make install 
5.查看swoole 
php -m
php --ri swoole
找到PHP版本的php.ini文件添加  -->查看执行那个PHP.ini文件====>php -i | grep php.ini
extension=swoole
```
#### 执行make install出现权限不足 
```
出现权限不足：
Installing shared extensions: /www/server/php/72/lib/php/extensions
/no-debug-non-zts-20170718/cp:cannot create regular file 
'/home/var/www/soft/php/lib/php/extensions/no-debug-non-zts-20170718/#INST@29034#': 
Permission denied

解决方法：
sudo chmod 777 /home/var/www/soft/php/lib/php/extensions/no-debug-non-zts-20170718/
sudo make install
```
![image.png](https://i.loli.net/2020/03/22/zxl8PSXJQ5kANHG.png)
#### telnet: command not found 服务不存在
[安装Telnet](https://blog.csdn.net/qq_38018165/article/details/89919556)
```
[vagrant@localhost ~]$ telnet 127.0.0.1 9501
-bash: telnet: command not found
解决办法
yum list telnet*              列出telnet相关的安装包
yum install telnet-server          安装telnet服务
yum install telnet.*           安装telnet客户端
```
#### 使用Xftp上传本地文件到centos上，传输文件类型显示错误
```
更改文件权限 
chmod 777  dir【文件/文件夹名称】
```

#### 安装使用异步redis前置条件
1.安装redis服务
2.安装hiredis库
3.重新编译swoole
[参考官网手册](https://wiki.swoole.com/wiki/index/prid-1)

#### 安装redis服务
```
官网下载redis包
进行编译 make
进入该目录中src 启动redis服务
[root@bogon src] ./redis-server
Increased maximum number of open files to 10032 (it was originally set to 1024).
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 5.0.5 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                   
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 9267
  `-._    `-._  `-./  _.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |           http://redis.io        
  `-._    `-._`-.__.-'_.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |                                  
  `-._    `-._`-.__.-'_.-'    _.-'                                   
      `-._    `-.__.-'    _.-'                                       
          `-._        _.-'                                           
  
```
#### 安装hiredis库并重新编译swoole
```
下载hiredis包:https://github.com/redis/hiredis/releases
解压hiredis包
cd 进入该目录  执行sudo make -j
执行sudo make install
执行sudo ldconfig
cd 进入swoole安装位置

执行以下命令
./configure --with-php-config=/home/var/www/soft/php/bin/php-config
清除先前编译缓存
make clean
make install
查看swoole扩展和redis扩展有没有安装成功
php -m  存在扩展
php --ri swoole  存在acry_redis
```



### 更改web服务器为Nginx
#### Linux安装Nginx报错make: *** No targets specified and no makefile found. Stop.解决方法
```
以下是在依赖包安装好前提下：
先运行./configure，生成makefile，再执行make，即可正常运行
```
#### nginx大致安装过程
```
一. gcc 安装
安装 nginx 需要先将官网下载的源码进行编译，编译依赖 gcc 环境，
如果没有 gcc 环境，则需要安装：

yum install gcc-c++

二. PCRE pcre-devel 安装
PCRE(Perl Compatible Regular Expressions) 是一个Perl库，包括 perl 兼容的正则表达式库。
nginx 的 http 模块使用 pcre 来解析正则表达式，所以需要在 linux 上安装 pcre 库，
pcre-devel 是使用 pcre 开发的一个二次开发库。nginx也需要此库。命令：

yum install -y pcre pcre-devel

三. zlib 安装
zlib 库提供了很多种压缩和解压缩的方式，
nginx 使用 zlib 对 http 包的内容进行 gzip ，所以需要在 Centos 上安装 zlib 库。

yum install -y zlib zlib-devel

四. OpenSSL 安装
OpenSSL 是一个强大的安全套接字层密码库，
囊括主要的密码算法、常用的密钥和证书封装管理功能及 SSL 协议，
并提供丰富的应用程序供测试或其它目的使用。
nginx 不仅支持 http 协议，还支持 https（即在ssl协议上传输http），
所以需要在 Centos 安装 OpenSSL 库。

yum install -y openssl openssl-devel

以上依赖包已安装完成

在根目录下进行安装【查看当前目录路径   pwd】
/root
下载包
wget -c https://nginx.org/download/nginx-1.12.0.tar.gz
解压包
tar -zxvf nginx-1.12.0.tar.gz
cd nginx-1.12.0
生成配置文件
./configure
编译
make
编译安装
make install
查看安装路径
whereis nginx
```

#### 使用高版本的swoole 4.4.9 协程Coroutine进行异步文件和异步数据库操作
```
//查看swoole版本  php --ri swoole
// 异步文件系统仅限于4.3.0之前的版本，后续版本已经全面使用协程（coroutine）代替原有方案，
//具体参见：Coroutine模块
//以下针对是4.3.0以下swoole的版本
//本次安装的swoole是4.4.9

 使用协程进行连接Mysql
// 第一种写法create缩写
// go() 是 Swoole\Coroutine::create() 的缩写
go(function () {
    //以下实例化都可以
    $db =new Co\MySQL();
    // $db = new Swoole\Coroutine\MySQL();
    $server = [
        'host' => '主机地址',
        'port' => 3306,
        'user' => 'root',
        'password' => '密码',
        'database' => 'swoole',
        'charset' => 'utf8', //指定字符集
    ];
    $res = $db->connect($server);
    // var_dump($res);
    $result = $db->query('SELECT * FROM test');
    // var_dump($result);
});
// 第二种写法
Co::create(function () {
    // $swoole_mysql = new Swoole\Coroutine\MySQL();
    $swoole_mysql =new Co\MySQL();
    $server = [
        'host' => '主机地址',
        'port' => 3306,
        'user' => 'root',
        'password' => '密码',
        'database' => 'swoole',
        'charset' => 'utf8', //指定字符集
    ];
    $res1 = $swoole_mysql->connect($server);
    $res = $swoole_mysql->query('select sleep(1)');
    var_dump($res);
});

协程异步文件操作：
use Swoole\Coroutine\System;
$SwooleReadFileName = __DIR__.'/log.txt';
go(function () use ($SwooleReadFileName)
{
    $r =  System::readFile($SwooleReadFileName);
    var_dump($r);
});

$fp = fopen(__DIR__ . "/log.txt", "r");
go(function () use ($fp)
{
    fseek($fp, 1);//移动文件指针到指定位置
    $r =  System::fread($fp);
    var_dump($r);
});
```
#### swoole中的task任务分发在TP5启用
```
Server->task方法

使用Task功能，必须先设置 task_worker_num，并且必须设置Server的onTask和onFinish事件回调函数

事件：
set配置项开启了 task_enable_coroutine
参考：http.php文件
```
#### swoole中的redis在TP5启用set一直失败
```
// 启用redis协程服务
go(function () use ($data) {
    // 使用命名空间 需要在swoole加\
    $redis = new \Swoole\Coroutine\Redis();
    $redis->connect(config('redis.host'), config('redis.port'));
    // 缓存到redis 参数
    $redis->set(Redis::smskey($data['phone']), $data['code']);
    // 验证码发送成功
    return Uitl::show(config('code.success'), 'Verification code success to send');
});

以上设置失效时间导致一直set失败或者是操作失误
redis 127.0.0.1:6379> SET KEY VALUE [EX seconds] [PX milliseconds] [NX|XX]
 
EX seconds − 设置指定的到期时间(以秒为单位)。
PX milliseconds - 设置指定的到期时间(以毫秒为单位)。
NX - 仅在键不存在时设置键。
XX - 只有在键已存在时才设置。
示例

redis 127.0.0.1:6379> SET mykey "redis" EX 60 NX
OK

```
