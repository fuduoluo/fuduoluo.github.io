---
title: 微信小程序支付--普通模式
tags: Wechat
top_img: https://ae01.alicdn.com/kf/Ua3feec8809e54301b362081d235e31ab8.jpg
comments: true
toc: 是否顯示toc （除非特定文章設置，可以不寫）
toc_number: 是否顯示toc數字 （除非特定文章設置，可以不寫）
copyright: true
cover: https://ae01.alicdn.com/kf/Ua3feec8809e54301b362081d235e31ab8.jpg
abbrlink: 9658c237
date: 2021-02-10 09:22:58
updated: 2021-02-10 09:22:58
top:
categories: wechat
keywords: 
description:
mathjax:
katex:
aside:
aplayer:
highlight_shrink:
---

{% note danger flat %}
以下是参照最新版本[微信支付文档](https://pay.weixin.qq.com/static/applyment_guide/applyment_index.shtml)进行编码
遵循规则请参考[APIv3接口规则](https://pay.weixin.qq.com/wiki/doc/apiv3/wechatpay/wechatpay-1.shtml)
{% endnote %}

{% note success flat %}
开放模式：普通模式
{% endnote %}

{% note info flat %}
最常规的普通模式，适用于有自己开发团队或外包开发商的直连商户收款。开发者申请自己的appid和mchid，两者需具备绑定关系，以此来使用微信支付提供的开放接口，对用户提供服务
{% endnote %}

![](https://pay.weixin.qq.com/wiki/doc/api/wxpay_v2/assets/img/common/pay/chapter1_13_7.png)

{% note success flat %}
接入模式：直连模式
{% endnote %}

{% note info flat %}
信息、资金流：微信支付—>直连商户
直连模式，商户自行申请入驻微信支付，无需服务商协助。（商户平台申请）成为普通商户
{% endnote %}

[接入准备参考](https://pay.weixin.qq.com/wiki/doc/apiv3/open/pay/chapter2_8_1.shtml)
{% note success flat %}
参数申请：
1.APPID
2.申请mchid
3.绑定APPID及mchid
{% endnote %}

[开发指引](https://pay.weixin.qq.com/wiki/doc/apiv3/open/pay/chapter2_8_2.shtml)
{% note success flat %}
1.用户通过商户小程序进入商户网页，当用户选择相关商品购买时，商户系统先调用该接口在微信支付服务后台生成预支付交易单。[会进行加密处理]
2.通过小程序下单API成功获取预支付交易会话标识（prepay_id）后，需要通过小程序调起支付API来调起微信支付收银台
3.notify_url回调函数处理需要进行返回数据解密处理判断是否是支付成功
{% endnote %}

{% note green 'fab fa-connectdevelop' modern %}
接入流程图
{% endnote %}

![业务流程图](https://pay.weixin.qq.com/wiki/doc/apiv3/assets/img/pay/wechatpay/6_2.png)

{% note blue 'fab fa-codiepie' modern %}
生成预支付订单
{% endnote %}

```
//统一下单接口必填参数
$data['appid'] = $appid;
$data['mchid'] = $mchid;
$data['description'] = $productName; //商品描述
$data['out_trade_no'] = $orderNum; //订单编号
$data['notify_url'] = $app_debug ? config('miniPayConfig.BaseNotifyPayUrl'): config('miniPayConfig.OnlineNotifyPayUrl'); //回调接口
$data['amount']['total'] = $payMoney; //金额
$data['payer']['openid'] = $openid;//用户openID
$data = json_encode($data);
```
```
//签名生成
$signature = $this->createSignature($data,$urlarr['path'],$randstr,$time);
//签名信息
$token = sprintf('mchid="%s",serial_no="%s",nonce_str="%s",timestamp="%d",signature="%s"',$mchid,$xlid,$randstr,$time,$signature);

//设置HTTP头 ： Authorization由认证类型[目前固定以下值]和签名信息两个部分组成
$header  = array(
    'Content-Type:'.'application/json; charset=UTF-8',
    'Accept:application/json',
    'User-Agent:*/*',
    'Authorization: WECHATPAY2-SHA256-RSA2048 '.$token
);
// 发送统一下单请求
$ret = $this->curl_post_https($url, $data, $header);
```

{% note blue 'fab fa-codiepie' modern %}
通过返回参数值客户端拉起小程序微信支付
{% endnote %}

```
// 组装数据返回前端拉起微信支付
$sign = [
    // 'appId'=>config('miniPayConfig.Appid'),
    'timeStamp'=> $time."" ,
    'nonceStr'=>$randstr,
    'package'=>$post,
    'signType'=>'RSA',
    'paySign'=>$str
];
```

{% note blue 'fab fa-codiepie' modern %}
根据回调地址进行解密等，从而进行业务处理
{% endnote %}

```
// 解密小程序微信支付敏感信息
$jsonDataString =  json_decode($xmlData, true);
$associated = $jsonDataString['resource']['associated_data'];
$nonce = $jsonDataString['resource']['nonce'];
$ciphertext = $jsonDataString['resource']['ciphertext'];

$apiv3key = config('miniPayConfig.ApiV3key'); //ApiV3key
// 解密敏感信息
$aseUtilInfo =  new AesUtil($apiv3key);
$info = $aseUtilInfo->decryptToString($associated, $nonce, $ciphertext);

$notifyArrinfo =  json_decode($info, true);
·
·
业务处理...
```
{% note success flat %}
API接口接口文档
{% endnote %}

[统一下单接口](https://pay.weixin.qq.com/wiki/doc/apiv3/apis/chapter3_5_1.shtml)
[小程序调起支付接口](https://pay.weixin.qq.com/wiki/doc/apiv3/apis/chapter3_5_4.shtml)
[支付通知+参数解密](https://pay.weixin.qq.com/wiki/doc/apiv3/apis/chapter3_5_5.shtml)
[支付成功签名验证](https://pay.weixin.qq.com/wiki/doc/apiv3/wechatpay/wechatpay4_1.shtml)


