---
title: PHP常用代码(文章)

copyright: true
abbrlink: f488806d
date: 2019-09-05 21:58:37
updated: 2019-12-04 12:01:07
cover: http://image.laputcat.top/blog/php.jpg
top_img: http://image.laputcat.top/blog/php.jpg
categories: PHP
tags: PHP
subtitle:
---


###### 100 个最常用的 PHP 函数
[100 个最常用的 PHP 函数文章](https://juejin.im/post/5c9b2e395188252d876e5b58)

###### PHP 完整实战 23 种设计模式

[PHP 完整实战 23 种设计模式](https://juejin.im/entry/5857b81b1b69e60056ec2f55)

<!--more-->

#### 获取IP地址

```
	private function clientIp($safe = false) {
		if (!$safe && env('HTTP_X_FORWARDED_FOR')) {
			$ipaddr = preg_replace('/(?:,.*)/', '', env('HTTP_X_FORWARDED_FOR'));
		} else {
			if (env('HTTP_CLIENT_IP')) {
				$ipaddr = env('HTTP_CLIENT_IP');
			} else {
				$ipaddr = env('REMOTE_ADDR');
			}
		}
	
		if (env('HTTP_CLIENTADDRESS')) {
			$tmpipaddr = env('HTTP_CLIENTADDRESS');
	
			if (!empty($tmpipaddr)) {
				$ipaddr = preg_replace('/(?:,.*)/', '', $tmpipaddr);
			}
		}
		return trim($ipaddr);
	}
```

#### 发送sms  以SDK包为准
```
function send_sms($mobile,$msg)
{
$authKey = "XXXXXXXXXXX";
date_default_timezone_set("Asia/Kolkata");
$date = strftime("%Y-%m-%d %H:%M:%S");
//Multiple mobiles numbers separated by comma
$mobileNumber = $mobile;
           
//Sender ID,While using route4 sender id should be 6 characters long.
$senderId = "IKOONK";
           
//Your message to send, Add URL encoding here.
$message = urlencode($msg);
           
//Define route 
$route = "template";
//Prepare you post parameters
$postData = array(
    'authkey' => $authKey,
    'mobiles' => $mobileNumber,
    'message' => $message,
    'sender' => $senderId,
    'route' => $route
);
           
//API URL
$url="https://control.msg91.com/sendhttp.php";
           
// init the resource
$ch = curl_init();
curl_setopt_array($ch, array(
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => $postData
    //,CURLOPT_FOLLOWLOCATION => true
));
           
           
//Ignore SSL certificate verification
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
           
           
//get response
$output = curl_exec($ch);
//Print error if any
if(curl_errno($ch))
{
    echo 'error:' . curl_error($ch);
}
           
curl_close($ch);
}
其中“$authKey = "XXXXXXXXXXX";”需要你输入你的密码，“$senderId = "IKOONK";”需要你输入你的 SenderID。当输入移动号码的时候需要指定国家代码 (比如，美国是 1，印度是 91 )。
语法：
<?php
$message = "Hello World";
$mobile = "918112998787";
send_sms($mobile,$message);
?>
```
#### 阿里云短信发送
```
	//新版短信API接口
	public function SendMessageByAliyun2($templateCode='',$mobiles='',$parmArr=array())
	{
		<!-- 需要下载对应的SDK包 -->
        $HttpSocket = new HttpSocket();
	
		//发送的接口URL
		$postUrl="https://dysmsapi.aliyuncs.com/";
		
		$params = array ();
		
		// *** 需用户填写部分 ***
		// fixme 必填：是否启用https
		$security = false;
		
		// fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
		$accessKeyId = "accessKeyId";
		$accessKeySecret = "accessKeySecret";
		// fixme 必填: 短信接收号码
		$params["PhoneNumbers"] = $mobiles;
		
		// fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
		$params["SignName"] = "签名名称";
		
		// fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
		$params["TemplateCode"] = "模板CODE";
		
		// fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
		//$params['TemplateParam'] = Array (
		//		"smscode" => "12345"
		//);
		if(!empty($parmArr))
			$params['TemplateParam']=$parmArr;
		
		// fixme 可选: 设置发送短信流水号
		//$params['OutId'] = "12345";
		
		// fixme 可选: 上行短信扩展码, 扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段
		//$params['SmsUpExtendCode'] = "1234567";
		
		
		// *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
		if(!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
			$params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
		}
		
		$params=array_merge($params, array(
						"RegionId" => "cn-hangzhou",
						"Action" => "SendSms",
						"Version" => "2017-05-25",
				));
		
		$apiParams = array_merge(array (
				"SignatureMethod" => "HMAC-SHA1",
				"SignatureNonce" => uniqid(mt_rand(0,0xffff), true),
				"SignatureVersion" => "1.0",
				"AccessKeyId" => $accessKeyId,
				"Timestamp" => gmdate("Y-m-d\TH:i:s\Z"),
				"Format" => "JSON",
		), $params);
		ksort($apiParams);
		
		$sortedQueryStringTmp = "";
		foreach ($apiParams as $key => $value) {
			$sortedQueryStringTmp .= "&" . $this->_encode($key) . "=" . $this->_encode($value);
		}
		
		$stringToSign = "POST&%2F&" . $this->_encode(substr($sortedQueryStringTmp, 1));
		
		$sign = base64_encode(hash_hmac("sha1", $stringToSign, $accessKeySecret . "&",true));
		
		$signature = $this->_encode($sign);
		
		$respond=$HttpSocket->post($postUrl,"Signature={$signature}{$sortedQueryStringTmp}");
		
		$jsonResult=json_decode($respond);
		if(isset($jsonResult->Code) && $jsonResult->Code=="OK")
			return true;
		else
			return false;
		
	}
```
#### 阻止 SQL 注入
```
function clean($input)
{
    if (is_array($input))
    {
        foreach ($input as $key => $val)
         {
            $output[$key] = clean($val);
            // $output[$key] = $this->clean($val);
        }
    }
    else
    {
        $output = (string) $input;
        // if magic quotes is on then use strip slashes
        if (get_magic_quotes_gpc()) 
        {
            $output = stripslashes($output);
        }
        // $output = strip_tags($output);
        $output = htmlentities($output, ENT_QUOTES, 'UTF-8');
    }
// return the clean text
    return $output;
}
语法：
<?php
$text = "<script>alert(1)</script>";
$text = clean($text);
echo $text;
?>
```
#### 检测用户位置[检测用户是在哪个城市访问你的网站
```
function detect_city($ip) {
                  
        $default = 'UNKNOWN';
           
        $curlopt_useragent = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6 (.NET CLR 3.5.30729)';
                  
        $url = 'http://ipinfodb.com/ip_locator.php?ip=' . urlencode($ip);
        $ch = curl_init();
                  
        $curl_opt = array(
            CURLOPT_FOLLOWLOCATION  => 1,
            CURLOPT_HEADER      => 0,
            CURLOPT_RETURNTRANSFER  => 1,
            CURLOPT_USERAGENT   => $curlopt_useragent,
            CURLOPT_URL       => $url,
            CURLOPT_TIMEOUT         => 1,
            CURLOPT_REFERER         => 'http://' . $_SERVER['HTTP_HOST'],
        );
                  
        curl_setopt_array($ch, $curl_opt);
                  
        $content = curl_exec($ch);
                  
        if (!is_null($curl_info)) {
            $curl_info = curl_getinfo($ch);
        }
                  
        curl_close($ch);
                  
        if ( preg_match('{<li>City : ([^<]*)</li>}i', $content, $regs) )  {
            $city = $regs[1];
        }
        if ( preg_match('{<li>State/Province : ([^<]*)</li>}i', $content, $regs) )  {
            $state = $regs[1];
        }
           
        if( $city!='' && $state!='' ){
          $location = $city . ', ' . $state;
          return $location;
        }else{
          return $default; 
        }
                  
    }

    语法
    <?php
    $ip = $_SERVER['REMOTE_ADDR'];
    $city = detect_city($ip);
    echo $city;
    ?>

```
####  获取 Web 页面的源代码
```
使用下面的函数，可以获取任意 Web 页面的 HTML 代码

function display_sourcecode($url)
{
$lines = file($url);
$output = "";
foreach ($lines as $line_num => $line) { 
    // loop thru each line and prepend line numbers
    $output.= "Line #<b>{$line_num}</b> : " . htmlspecialchars($line) . "\n";
}
}
语法：
<?php
$url = "http://blog.koonk.com";
$source = display_sourcecode($url);
echo $source;
?>
```
#### 获取用户真实IP
```
function getRealIpAddr()  
{  
    if (!emptyempty($_SERVER['HTTP_CLIENT_IP']))  
    {  
        $ip=$_SERVER['HTTP_CLIENT_IP'];  
    }  
    elseif (!emptyempty($_SERVER['HTTP_X_FORWARDED_FOR']))  
    //to check ip is pass from proxy  
    {  
        $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];  
    }  
    else  
    {  
        $ip=$_SERVER['REMOTE_ADDR'];  
    }  
    return $ip;  
}
语法：

<?php
$ip = getRealIpAddr();
echo $ip;
?>
```
####  强制性文件下载
```
如果你需要下载特定的文件而不用另开新窗口，下面的代码片段可以帮助你。

function force_download($file) 
{ 
    $dir      = "../log/exports/"; 
    if ((isset($file))&&(file_exists($dir.$file))) { 
       header("Content-type: application/force-download"); 
       header('Content-Disposition: inline; filename="' . $dir.$file . '"'); 
       header("Content-Transfer-Encoding: Binary"); 
       header("Content-length: ".filesize($dir.$file)); 
       header('Content-Type: application/octet-stream'); 
       header('Content-Disposition: attachment; filename="' . $file . '"'); 
       readfile("$dir$file"); 
    } else { 
       echo "No file selected"; 
    } 
}

语法：

<php
force_download("image.jpg");
?>
```
#### 把秒转换成天数，小时数和分钟
```
function secsToStr($secs) {
    if($secs>=86400){$days=floor($secs/86400);$secs=$secs%86400;$r=$days.' day';if($days<>1){$r.='s';}if($secs>0){$r.=', ';}}
    if($secs>=3600){$hours=floor($secs/3600);$secs=$secs%3600;$r.=$hours.' hour';if($hours<>1){$r.='s';}if($secs>0){$r.=', ';}}
    if($secs>=60){$minutes=floor($secs/60);$secs=$secs%60;$r.=$minutes.' minute';if($minutes<>1){$r.='s';}if($secs>0){$r.=', ';}}
    $r.=$secs.' second';if($secs<>1){$r.='s';}
    return $r;
}
语法：
<?php
$seconds = "56789";
$output = secsToStr($seconds);
echo $output;
?>
```
#### 检测用户语言
```
使用下面的 PHP 代码片段可以检测用户浏览器所使用的语言

function get_client_language($availableLanguages, $default='en'){
    if (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
        $langs=explode(',',$_SERVER['HTTP_ACCEPT_LANGUAGE']);
        foreach ($langs as $value){
            $choice=substr($value,0,2);
            if(in_array($choice, $availableLanguages)){
                return $choice;
            }
        }
    } 
    return $default;
}
```
#### 获取当前页面 URL
```
这个 PHP 片段可以帮助你让用户登录后直接跳转到之前浏览的页面

function current_url()
{
$url = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
$validURL = str_replace("&", "&", $url);
return validURL;
}
```
#### 计算两个地图坐标之间的距离
```
function getDistanceBetweenPointsNew($latitude1, $longitude1, $latitude2, $longitude2) {
    $theta = $longitude1 - $longitude2;
    $miles = (sin(deg2rad($latitude1)) * sin(deg2rad($latitude2))) + (cos(deg2rad($latitude1)) * cos(deg2rad($latitude2)) * cos(deg2rad($theta)));
    $miles = acos($miles);
    $miles = rad2deg($miles);
    $miles = $miles * 60 * 1.1515;
    $feet = $miles * 5280;
    $yards = $feet / 3;
    $kilometers = $miles * 1.609344;
    $meters = $kilometers * 1000;
    return compact('miles','feet','yards','kilometers','meters'); 
}

语法：

<?php
$point1 = array('lat' => 40.770623, 'long' => -73.964367);
$point2 = array('lat' => 40.758224, 'long' => -73.917404);
$distance = getDistanceBetweenPointsNew($point1['lat'], $point1['long'], $point2['lat'], $point2['long']);
foreach ($distance as $unit => $value) {
    echo $unit.': '.number_format($value,4).'';
}
```
#### 获取远程文件大小
```
 function remote_filesize($url, $user = "", $pw = "")
{
    ob_start();
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HEADER, 1);
    curl_setopt($ch, CURLOPT_NOBODY, 1);
    if(!empty($user) && !empty($pw))
    {
        $headers = array('Authorization: Basic ' .  base64_encode("$user:$pw"));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    }
    $ok = curl_exec($ch);
    curl_close($ch);
    $head = ob_get_contents();
    ob_end_clean();
    $regex = '/Content-Length:\s([0-9].+?)\s/';
    $count = preg_match($regex, $head, $matches);
    return isset($matches[1]) ? $matches[1] : "unknown";
}
语法：

<?php
$file = "http://koonk.com/images/logo.png";
$size = remote_filesize($url);
echo $size;
?>
```
#### 检查网站是否宕机
```
function Visit($url){
    $agent = "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)";$ch=curl_init();
    curl_setopt ($ch, CURLOPT_URL,$url );
    curl_setopt($ch, CURLOPT_USERAGENT, $agent);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt ($ch,CURLOPT_VERBOSE,false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
    curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch,CURLOPT_SSLVERSION,3);
    curl_setopt($ch,CURLOPT_SSL_VERIFYHOST, FALSE);
    $page=curl_exec($ch);
    //echo curl_error($ch);
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    if($httpcode>=200 && $httpcode<300) return="" true;="" else="" false;="" }="" if="" (visit("http:="" www.google.com"))="" echo="" "website="" ok"."n";="" down";<="" pre="">
```